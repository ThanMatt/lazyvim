local Util = require("lazyvim.util")

return {
  "nvim-telescope/telescope.nvim",
  keys = {
    -- enable finding hidden/dot files
    {
      "<leader><leader>",
      Util.telescope("files", { hidden = true, no_ignore = false }),
      desc = "Find files (root dir)",
    },
  },
}
