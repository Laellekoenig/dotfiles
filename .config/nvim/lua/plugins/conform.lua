return {
  {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          -- lua = { "stylua" },
          -- Conform will run multiple formatters sequentially
          -- python = { "isort", "black" },
          -- You can customize some of the format options for the filetype (:help conform.format)
          -- rust = { "rustfmt", lsp_format = "fallback" },
          -- Conform will run the first available formatter
          -- javascript = { "prettierd", "prettier", stop_after_first = true },
          swift = { "swiftformat" },
          javascript = { "prettier" },
          javascriptreact = { "prettier" },
          html = { "prettier" },
          css = { "prettier" },
          typescript = { "prettier" },
          typescriptreact = { "prettier" },
          astro = { "prettier" },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_format = "fallback",
        },
      })
    end
  }
}
