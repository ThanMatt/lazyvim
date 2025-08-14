return {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  priority = 1000,
  opts = function()
    return {
      defaults = {
        hidden = true,
      },
      pickers = {
        find_files = {
          find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
          hidden = true,
        },
      },
    }
  end,
}

