-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Copy filename to clipboard
vim.keymap.set('n', '<leader>fn', function()
  local filename = vim.fn.expand("%:t")
  vim.fn.setreg("+", filename)
  vim.notify("📋 Copied filename: " .. filename, vim.log.levels.INFO)
end, { desc = 'Copy filename only' })

vim.keymap.set('n', '<leader>fp', function()
  local filepath = vim.fn.expand("%")
  vim.fn.setreg("+", filepath)
  vim.notify("📋 Copied path: " .. filepath, vim.log.levels.INFO)
end, { desc = 'Copy file path (relative)' })

vim.keymap.set('n', '<leader>fP', function()
  local fullpath = vim.fn.expand("%:p")
  vim.fn.setreg("+", fullpath)
  vim.notify("📋 Copied full path: " .. fullpath, vim.log.levels.INFO)
end, { desc = 'Copy file path (absolute)' })

-- Map <leader><leader> to telescope git files
vim.keymap.set('n', '<leader><leader>', '<cmd>Telescope git_files<cr>', { desc = 'Find git files' })

-- Map tab to toggle fold (like emacs + evil mode)
vim.keymap.set('n', '<Tab>', 'za', { desc = 'Toggle fold' })

-- Restore default H/L behavior (overrides LazyVim buffer switching)
vim.keymap.set('n', 'H', 'H', { desc = 'Move cursor to top of screen' })
vim.keymap.set('n', 'L', 'L', { desc = 'Move cursor to bottom of screen' })

