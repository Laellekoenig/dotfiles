return {
  -- Lua
  {
    "folke/zen-mode.nvim",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },

    config = function()
      local openZen = function()
        require("zen-mode").toggle({
          window = {
            width = .6
          },
          plugins = {
            tmux = { enabled = true },
          }
        })
      end

      vim.keymap.set("n", "<leader>z", openZen)
    end
  }
}
