return {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  priority = 1000,
  opts = function()
    return {
      defaults = {
        hidden = true,
        cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1],
        layout_config = {
          prompt_position = "top",
        },
        sorting_strategy = "ascending",
      },
      pickers = {
        find_files = {
          find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
          hidden = true,
        },
        live_grep = {},
      },
      extensions = {
        file_browser = {
          respect_gitignore = false,
        },
      },
    }
  end,
}

