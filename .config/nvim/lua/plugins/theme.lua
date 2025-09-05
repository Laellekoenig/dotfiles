local mode = "light"

return {
  {
    "daschw/leaf.nvim",
    enabled = false,
    config = function()
      vim.opt.background = mode
      vim.cmd("colorscheme leaf")
    end
  },
  {
    "rose-pine/neovim",
    enabled = true,
    name = "rose-pine",
    config = function()
      vim.opt.background = mode
      vim.cmd("colorscheme rose-pine")
    end
  },
}
