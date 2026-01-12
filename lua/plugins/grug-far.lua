-- :: Grug-far custom keymaps
return {
  "MagicDuck/grug-far.nvim",
  keys = {
    -- :: Search and replace in current file only
    {
      "<leader>sF",
      function()
        local grug = require("grug-far")
        local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
        grug.open({
          prefills = {
            paths = vim.fn.expand("%"),
          },
        })
      end,
      mode = { "n", "v" },
      desc = "Search and Replace (current file)",
    },
  },
}
