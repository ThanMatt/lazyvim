return {
  "akinsho/git-conflict.nvim",
  version = "*",
  config = function()
    require("git-conflict").setup()

    -- Gruvbox-friendly merge highlights
    vim.api.nvim_set_hl(0, "GitConflictCurrent", { bg = "#3c3836" }) -- dark gray for "ours"
    vim.api.nvim_set_hl(0, "GitConflictIncoming", { bg = "#32302f" }) -- slightly darker gray for "theirs"
    vim.api.nvim_set_hl(0, "GitConflictAncestor", { bg = "#282828" }) -- base section

    -- Optional: make labels match Gruvbox's accent colors
    vim.api.nvim_set_hl(0, "GitConflictCurrentLabel", { fg = "#b8bb26", bg = "#3c3836", bold = true }) -- green label
    vim.api.nvim_set_hl(0, "GitConflictIncomingLabel", { fg = "#83a598", bg = "#32302f", bold = true }) -- blue label
    vim.api.nvim_set_hl(0, "GitConflictAncestorLabel", { fg = "#fabd2f", bg = "#282828", bold = true }) -- yellow label
  end,
}
