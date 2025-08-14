return {
  "folke/snacks.nvim",
  opts = {
    dashboard = { enabled = false },
    notifier = { enabled = true },

    -- show hidden files in snacks.explorer
    picker = {
      sources = {
        explorer = {
          hidden = true,
          ignored = true,
          exclude = { "node_modules", ".git" },
          win = {
            list = {
              wo = {
                number = true,
                relativenumber = true,
              },
            },
          },
        },
        recent = {
          filter = {
            paths = false,
          },
        },
      },
    },
  },
}
