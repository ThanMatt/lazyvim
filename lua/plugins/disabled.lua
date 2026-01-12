-- :: Disable unused plugins for performance
return {
  -- :: Disable SQL dadbod plugins
  { "tpope/vim-dadbod", enabled = false },
  { "kristijanhusak/vim-dadbod-ui", enabled = false },
  { "kristijanhusak/vim-dadbod-completion", enabled = false },

  -- :: Disable render-markdown
  { "MeanderingProgrammer/render-markdown.nvim", enabled = false },

  -- :: Disable noice for vanilla Neovim UI
  { "folke/noice.nvim", enabled = false },

  -- :: Disable indent-blankline for cleaner look
  { "lukas-reineke/indent-blankline.nvim", enabled = false },
}
