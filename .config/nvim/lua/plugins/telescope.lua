return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
    },
    config = function()
      -- config
      local actions = require("telescope.actions")
      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ["<C-n>"] = actions.toggle_selection + actions.move_selection_worse,
              ["<C-p>"] = actions.toggle_selection + actions.move_selection_better,
              ["<S-Tab>"] = actions.move_selection_previous,
              ["<Tab>"] = actions.move_selection_next,
            },
          },
        },
        pickers = {
          find_files = {
            theme = "ivy",
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          },
        },
      }

      -- extensions
      require('telescope').load_extension('fzf')

      -- keymap
      vim.keymap.set('n', '<leader>ff', require("telescope.builtin").find_files)
      vim.keymap.set('n', '<leader>fg', require("telescope.builtin").live_grep)
      vim.keymap.set('n', '<leader>fc', require("telescope.builtin").current_buffer_fuzzy_find)
      vim.keymap.set('n', '<leader>fh', require("telescope.builtin").help_tags)
      vim.keymap.set('n', '<leader>fd', require("telescope.builtin").diagnostics)
      vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, {})
      vim.keymap.set("n", "gi", require("telescope.builtin").lsp_implementations, {})
      vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, {})
      vim.keymap.set('n', '<leader>fe', function()
        require("telescope.builtin").find_files {
          cwd = vim.fn.stdpath("config")
        }
      end)
    end
  }
}
