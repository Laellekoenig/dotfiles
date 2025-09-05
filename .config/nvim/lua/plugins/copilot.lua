return {
  "github/copilot.vim",
  config = function()
    vim.keymap.set("i", "<c-q>", "copilot#Accept('\\<cr>')", { expr = true, silent = true, replace_keycodes = false })
    vim.g.copilot_no_tab_map = true
    vim.g.copilot_enabled = false
  end
}
