return {
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local nls = require("null-ls")
      local fmt = nls.builtins.formatting
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

      nls.setup({
        sources = {
          -- 🧩 Google Java Format for Java
          fmt.google_java_format.with({
            extra_args = { "--aosp" }, -- optional: Android-style (2-space indent)
          }),

          -- 🌐 Prettier daemon for JS / TS / Web files
          fmt.prettierd.with({
            filetypes = {
              "javascript",
              "typescript",
              "javascriptreact",
              "typescriptreact",
              "json",
              "jsonc",
              "yaml",
              "css",
              "scss",
              "markdown",
              "graphql",
            },
            extra_args = { "--trailing-comma", "none" },
          }),
        },

        -- Auto-format on save
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
              end,
            })
          end
        end,
      })
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason-org/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    opts = {
      ensure_installed = {
        "google-java-format",
        "prettierd",
      },
    },
  },
}

