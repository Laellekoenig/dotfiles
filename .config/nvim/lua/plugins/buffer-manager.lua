return {
  {
    "j-morano/buffer_manager.nvim",
    config = function()
      vim.keymap.set("n", "<c-b>", require("buffer_manager.ui").toggle_quick_menu)
    end
  },
}
