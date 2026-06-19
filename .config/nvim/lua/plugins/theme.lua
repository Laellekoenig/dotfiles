local function system_background()
  if vim.fn.has("mac") == 1 or vim.fn.has("macunix") == 1 then
    local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
    local result = handle and handle:read("*a") or ""

    if handle then
      handle:close()
    end

    return result:match("Dark") and "dark" or "light"
  end

  return "dark"
end

local function apply_system_background()
  local background = system_background()

  if vim.o.background ~= background then
    vim.o.background = background
    vim.cmd.colorscheme("rose-pine")
  end
end

local function watch_system_background()
  local uv = vim.uv or vim.loop
  local timer = uv.new_timer()

  timer:start(0, 2000, function()
    vim.schedule(apply_system_background)
  end)

  vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
      timer:stop()
      timer:close()
    end,
  })
end

return {
  {
    "daschw/leaf.nvim",
    enabled = false,
    config = function()
      vim.opt.background = system_background()
      vim.cmd("colorscheme leaf")
    end
  },
  {
    "rose-pine/neovim",
    enabled = true,
    name = "rose-pine",
    config = function()
      vim.opt.background = system_background()
      vim.cmd("colorscheme rose-pine")
      watch_system_background()
    end
  },
}
