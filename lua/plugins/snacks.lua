return {
  "folke/snacks.nvim",
  opts = {
    dashboard = { enabled = false },
    notifier = { enabled = true },
    scratch = {
      enabled = true,
      ft = "markdown", -- default filetype
      win = {
        bo = {
          filetype = "markdown",
        },
      },
      -- Disable diagnostics in scratch buffers
      on_create = function(buf)
        vim.diagnostic.disable(buf)
        vim.bo[buf].spell = false
      end,
    },

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
