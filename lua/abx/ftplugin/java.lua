local home = os.getenv("HOME")
local workspace_path = home .. "/.local/share/nvim/jdtls-workspace/"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = workspace_path .. project_name

-- Require modules safely
local jdtls_status, jdtls = pcall(require, "jdtls")
if not jdtls_status then
	return
end

local dap_status, dap = pcall(require, "dap")

-- Find root dir using lspconfig util
local root_pattern = require("lspconfig.util").root_pattern
local root_dir = root_pattern(".git", "mvnw", "gradlew", "pom.xml", "build.gradle")(vim.fn.getcwd())

-- Debug print to confirm root_dir
print("Java root dir: ", root_dir)

if not root_dir then
	print("⚠️ jdtls root_dir not found! Make sure you're inside a proper Java project.")
	return
end

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
		home .. "/.local/share/nvim/mason/packages/jdtls/config_linux/",
		"-data",
		workspace_dir,
	},
	root_dir = root_dir,
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

local lspconfig = require("lspconfig")

-- Only override if not already defined
if not lspconfig.configs.jdtls then
	lspconfig.configs.jdtls = {
		default_config = {
			cmd = { "jdtls" }, -- dummy command
			filetypes = { "java" },
			root_dir = function()
				return nil
			end, -- disables auto root detection
		},
	}
end
-- Start or Attach JDTLS
jdtls.start_or_attach(config)

-- DAP Setup if DAP is available
if dap_status then
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

	dap.configurations.java = {
		{
			type = "java",
			request = "launch",
			name = "Launch Current File",
			mainClass = function()
				local file = vim.fn.expand("%:p")
				local content = vim.fn.readfile(file)

				local package_name
				for _, line in ipairs(content) do
					local match = line:match("^%s*package%s+([%w%.]+)%s*;")
					if match then
						package_name = match
						break
					end
				end

				local class_name = vim.fn.expand("%:t:r")

				if package_name then
					return package_name .. "." .. class_name
				else
					return class_name
				end
			end,
			projectName = project_name,
			cwd = vim.fn.getcwd(),
			console = "integratedTerminal",
		},
	}
end

-- Keymaps for Java LSP
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = true, desc = "Go to Definition" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = true, desc = "Show Hover" })
vim.keymap.set("n", "<leader>co", function()
	jdtls.organize_imports()
end, { desc = "Organize Imports" })
vim.keymap.set("n", "<leader>crv", function()
	jdtls.extract_variable()
end, { desc = "Extract Variable" })
vim.keymap.set(
	"v",
	"<leader>crv",
	"<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>",
	{ desc = "Extract Variable (Visual)" }
)
vim.keymap.set("n", "<leader>crc", function()
	jdtls.extract_constant()
end, { desc = "Extract Constant" })
vim.keymap.set(
	"v",
	"<leader>crc",
	"<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>",
	{ desc = "Extract Constant (Visual)" }
)
vim.keymap.set(
	"v",
	"<leader>crm",
	"<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>",
	{ desc = "Extract Method" }
)
