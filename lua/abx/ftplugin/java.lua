local home = os.getenv("HOME")
local workspace_path = home .. "/.local/share/nvim/jdtls-workspace/"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = workspace_path .. project_name

-- Safely require modules
local jdtls_status, jdtls = pcall(require, "jdtls")
if not jdtls_status then
	return
end

local dap_status, dap = pcall(require, "dap")

-- Extended capabilities
local extendedClientCapabilities = jdtls.extendedClientCapabilities

-- Setup JDTLS Config
local config = {
	cmd = {
		"/usr/lib/jvm/java-21-openjdk/bin/java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xmx1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-javaagent:" .. home .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar",
		"-jar",
		vim.fn.glob(home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
		"-configuration",
		home .. "/.local/share/nvim/mason/packages/jdtls/config_linux_arm/",
		"-data",
		workspace_dir,
	},
	root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
	settings = {
		java = {
			configuration = {
				runtimes = {
					{ name = "JavaSE-21", path = "/usr/lib/jvm/jre-21-openjdk/" },
				},
				signatureHelp = { enabled = true },
				extendedClientCapabilities = extendedClientCapabilities,
				maven = { downloadSources = true },
				referencesCodeLens = { enabled = true },
				references = { includeDecompiledSources = true },
				inlayHints = { parameterNames = { enabled = "all" } },
				format = { enabled = true },
			},
		},
	},
	init_options = {
		bundles = {},
	},
}

-- Start or Attach JDTLS
jdtls.start_or_attach(config)

-- DAP Setup if DAP is available
if dap_status then
	-- Define how java debug adapter is initialized
	dap.adapters.java = function(callback, config)
		jdtls.execute_command({ command = "vscode.java.startDebugSession" }, function(err, port)
			assert(not err, vim.inspect(err))
			callback({
				type = "server",
				host = "127.0.0.1",
				port = port,
			})
		end)
	end

	-- DAP configurations
	dap.configurations.java = {
		{
			type = "java",
			request = "launch",
			name = "Launch Current File",
			mainClass = function()
				local file = vim.fn.expand("%:p")
				local content = vim.fn.readfile(file)

				-- Detect package
				local package_name
				for _, line in ipairs(content) do
					local match = line:match("^%s*package%s+([%w%.]+)%s*;")
					if match then
						package_name = match
						break
					end
				end

				-- Get class name from file name
				local class_name = vim.fn.expand("%:t:r")

				-- Full mainClass path
				if package_name then
					return package_name .. "." .. class_name
				else
					return class_name
				end
			end,
			projectName = function()
				return vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
			end,
			cwd = vim.fn.getcwd(),
			console = "integratedTerminal",
		},
	}
end

-- Keymaps for Java actions
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = true, desc = "Go to Definition" })
vim.keymap.set("n", "<leader>co", "<Cmd>lua require'jdtls'.organize_imports()<CR>", { desc = "Organize Imports" })
vim.keymap.set("n", "<leader>crv", "<Cmd>lua require('jdtls').extract_variable()<CR>", { desc = "Extract Variable" })
vim.keymap.set(
	"v",
	"<leader>crv",
	"<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>",
	{ desc = "Extract Variable" }
)
vim.keymap.set("n", "<leader>crc", "<Cmd>lua require('jdtls').extract_constant()<CR>", { desc = "Extract Constant" })
vim.keymap.set(
	"v",
	"<leader>crc",
	"<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>",
	{ desc = "Extract Constant" }
)
vim.keymap.set(
	"v",
	"<leader>crm",
	"<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>",
	{ desc = "Extract Method" }
)
