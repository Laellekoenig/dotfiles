vim.api.nvim_create_user_command("Dark", function()
  vim.opt.background = "dark"
end, {})

vim.api.nvim_create_user_command("Light", function()
  vim.opt.background = "light"
end, {})

vim.api.nvim_create_user_command("Pin", function()
  vim.lsp.buf.execute_command({ command = 'tinymist.pinMain', arguments = { vim.api.nvim_buf_get_name(0) } })
end, {})
