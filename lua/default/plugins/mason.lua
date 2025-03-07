return {
	"williamboman/mason.nvim",
	opts = {
		ensure_installed = {
			"tsserver", -- TypeScript & JavaScript LSP
			"eslint_d", -- Linter for JS/TS
			"prettier", -- Formatter for JS/TS
		},
	},
}
