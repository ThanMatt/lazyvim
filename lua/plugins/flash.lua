return {
  "folke/flash.nvim",
  opts = {
    highlight = {
      backdrop = false,
      groups = {
        match = "FlashMatch",
        current = "FlashCurrent", 
        backdrop = "FlashBackdrop",
        label = "FlashLabel",
      },
    },
  },
  config = function(_, opts)
    require("flash").setup(opts)
    
    -- Custom highlight groups
    vim.api.nvim_set_hl(0, "FlashMatch", {
      underline = true,
      undercurl = true,
      bold = true,
      bg = "NONE",
      fg = "NONE",
      sp = "#ffff00", -- underline color (bright yellow)
    })
    
    vim.api.nvim_set_hl(0, "FlashCurrent", {
      bg = "#ff9900",
      fg = "#000000",
      bold = true,
    })
    
    vim.api.nvim_set_hl(0, "FlashLabel", {
      underline = true,
      undercurl = true,
      bold = true,
      bg = "NONE", 
      fg = "NONE",
      sp = "#ffff00", -- underline color (bright yellow)
    })
  end,
}