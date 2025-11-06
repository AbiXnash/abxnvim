return {
  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    opts = {
      registries = {
        "github:nvim-java/mason-registry",
        "github:mason-org/mason-registry",
      },
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
    keys = {
      { "<leader>m", "<cmd>Mason<CR>" },
    },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls" },
      automatic_enable = true,
    },
  },

  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } },
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = { "j-hui/fidget.nvim", opts = {} },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local servers = require("mason-lspconfig").get_installed_servers()

      local has_new = vim.lsp and vim.lsp.config
      local lsp = has_new and vim.lsp or require("lspconfig")

      -- --- Java (explicit)
      if has_new then
        vim.lsp.config("jdtls", {
          capabilities = capabilities,
          filetypes = { "java" },
        })
        vim.lsp.enable({ "jdtls" })
      else
        lsp.jdtls.setup({
          capabilities = capabilities,
          filetypes = { "java" },
        })
      end

      -- --- All other servers
      for _, server in ipairs(servers) do
        if server ~= "jdtls" then
          local ok, defaults = pcall(require, "lspconfig.server_configurations." .. server)
          local fts = (ok and defaults.default_config.filetypes) or {}

          local opts = {
            capabilities = capabilities,
            filetypes = fts,
          }

          -- Lua-specific override
          if server == "lua_ls" then
                        print("is here")
            opts.settings = {
              Lua = {
                runtime = { version = "LuaJIT" },
                diagnostics = {
                  globals = { "vim" },
                },
                workspace = {
                  checkThirdParty = false,
                  library = {
                    vim.env.VIMRUNTIME,
                    "${3rd}/luv/library",
                    "${3rd}/busted/library",
                  },
                },
                telemetry = { enable = false },
              },
            }
          end

          if has_new then
            vim.lsp.config(server, opts)
            vim.lsp.enable({ server })
          else
            lsp[server].setup(opts)
          end
        end
      end
    end,
  },
}
