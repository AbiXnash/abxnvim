return {
	"mfussenegger/nvim-lint",
	event = { "User AstroFile", "BufReadPre", "BufNewFile" },
	dependencies = { "williamboman/mason.nvim" },
	opts = {
		linters_by_ft = {
			go = { "staticcheck" },
			lua = { "selene" },
			sh = { "shellcheck" },
			python = { "bandit", "mypy" },
			markdown = { "markdownlint" },
			cfn = { "cfn_lint" },
		},
		linters = {
			cfn_lint = { ignore_exitcode = true },
		},
	},
	config = function(_, opts)
		local lint = require("lint")

		-- Set linters by file type
		lint.linters_by_ft = opts.linters_by_ft or {}

		-- Merge user-defined linters with existing ones
		for name, linter in pairs(opts.linters or {}) do
			lint.linters[name] = (type(linter) == "table" and type(lint.linters[name]) == "table")
					and vim.tbl_deep_extend("force", lint.linters[name], linter)
				or linter
		end

		-- Helper function to filter valid linters
		local function valid_linters(ctx, linters)
			if not linters then
				return {}
			end
			return vim.tbl_filter(function(name)
				local linter = lint.linters[name]
				return linter
					and vim.fn.executable(linter.cmd) == 1
					and not (type(linter) == "table" and linter.condition and not linter.condition(ctx))
			end, linters)
		end

		-- Override linter resolution to handle fallbacks
		local orig_resolve_linter_by_ft = lint._resolve_linter_by_ft
		lint._resolve_linter_by_ft = function(...)
			local ctx = { filename = vim.api.nvim_buf_get_name(0) }
			ctx.dirname = vim.fn.fnamemodify(ctx.filename, ":h")

			local linters = valid_linters(ctx, orig_resolve_linter_by_ft(...))
			if not linters[1] then
				linters = valid_linters(ctx, lint.linters_by_ft["_"])
			end -- fallback
			require("astrocore").list_insert_unique(linters, valid_linters(ctx, lint.linters_by_ft["*"])) -- global

			return linters
		end

		-- Start linting immediately
		lint.try_lint()

		-- Auto-run linting on various events
		local timer = vim.loop.new_timer()
		vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave", "TextChanged" }, {
			group = vim.api.nvim_create_augroup("auto_lint", { clear = true }),
			desc = "Automatically try linting",
			callback = function()
				timer:start(100, 0, function()
					timer:stop()
					vim.schedule(lint.try_lint)
				end)
			end,
		})
	end,
}
