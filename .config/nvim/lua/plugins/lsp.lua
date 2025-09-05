return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
      'saghen/blink.cmp',
    },
    config = function()
      local config = require("lspconfig")
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- lsps
      config.lua_ls.setup {
        capabilities = capabilities
      }

      config.sourcekit.setup {
        capabilities = capabilities,
        cmd = { "xcrun", "sourcekit-lsp" },
        filetypes = { "swift", "objective-c", "objective-cpp" },
        root_dir = config.util.root_pattern(".git", "Package.swift")
      }

      config.ts_ls.setup {
        capabilities = capabilities,
      }

      config.astro.setup {
        capabilities = capabilities,
      }

      config.tinymist.setup {
        capabilities = capabilities,
        settings = {
          formatterMode = "typstyle",
          projectResolution = "lockDatabase"
        }
      }

      -- keybinds
      vim.keymap.set("n", "rn", vim.lsp.buf.rename)
      vim.keymap.set("n", "ca", vim.lsp.buf.code_action)
    end
  }
}
