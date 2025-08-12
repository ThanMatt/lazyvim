return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      hidden = true,
    },
    pickers = {
      find_files = {
        find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
      },
    },
  },
}