-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Copy filename to clipboard
vim.keymap.set('n', '<leader>fn', ':let @+ = expand("%:t")<CR>', { desc = 'Copy filename only' })
vim.keymap.set('n', '<leader>fp', ':let @+ = expand("%")<CR>', { desc = 'Copy file path (relative)' })
vim.keymap.set('n', '<leader>fP', ':let @+ = expand("%:p")<CR>', { desc = 'Copy file path (absolute)' })
