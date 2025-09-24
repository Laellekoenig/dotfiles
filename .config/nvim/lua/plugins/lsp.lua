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
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- lsps
      vim.lsp.config("lua_ls", {
        capabilities = capabilities
      })

      vim.lsp.config("sourcekit", {
        capabilities = capabilities,
        cmd = { "xcrun", "sourcekit-lsp" },
        filetypes = { "swift", "objective-c", "objective-cpp" },
        -- root_dir = config.util.root_pattern(".git", "Package.swift")
      })

      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
      })

      vim.lsp.config("astro", {
        capabilities = capabilities,
      })

      vim.lsp.config("tinymist", {
        capabilities = capabilities,
        settings = {
          formatterMode = "typstyle",
          projectResolution = "lockDatabase"
        }
      })

      -- keybinds
      vim.keymap.set("n", "rn", vim.lsp.buf.rename)
      vim.keymap.set("n", "ca", vim.lsp.buf.code_action)
    end
  }
}
