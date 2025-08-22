return {
  "folke/flash.nvim",
  opts = {
    highlight = {
      backdrop = false,
      matches = true,
      priority = 5000,
      groups = {
        match = "FlashMatch",
        current = "FlashCurrent", 
        backdrop = "FlashBackdrop",
        label = "FlashLabel",
      },
    },
    modes = {
      char = {
        highlight = { backdrop = false },
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
    
    -- Ensure backdrop is completely transparent
    vim.api.nvim_set_hl(0, "FlashBackdrop", {
      bg = "NONE",
      fg = "NONE",
    })
  end,
}