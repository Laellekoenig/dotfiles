return {
  "mfussenegger/nvim-lint",
  config = function()
    require("lint").linters_by_ft = {
      swift = { "swiftlint" },
    }

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        -- try_lint without arguments runs the linters defined in `linters_by_ft`
        -- for the current filetype
        require("lint").try_lint()

        -- require("lint").try_lint("cspell")
      end,
    })
  end
}
