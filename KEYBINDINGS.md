# LazyVim Keybindings Reference

## Leader Key Commands (`<space>`)

### Buffer Management
- `<leader>bb` - Switch to other buffer
- `<leader>bd` - Delete current buffer  
- `<leader>bo` - Delete other buffers
- `<leader>bD` - Delete buffer and window

### Files
- `<leader>fn` - Create new file

### Git Operations  
- `<leader>gg` - Open Lazygit (root dir)
- `<leader>gG` - Open Lazygit (cwd)
- `<leader>gf` - Git file history
- `<leader>gl` - Git log (root)
- `<leader>gL` - Git log (cwd)
- `<leader>gb` - Git blame line
- `<leader>gB` - Git browse (open)
- `<leader>gY` - Git browse (copy URL)

### Code/LSP
- `<leader>cd` - Line diagnostics
- `<leader>cf` - Format buffer
- `<leader>co` - Organize imports (TypeScript)
- `<leader>cR` - Rename file (TypeScript)

### Diagnostics/Quickfix
- `<leader>xq` - Toggle quickfix
- `<leader>xl` - Toggle location list

### UI Toggles
- `<leader>uf` - Toggle format
- `<leader>us` - Toggle spelling  
- `<leader>uw` - Toggle word wrap
- `<leader>uL` - Toggle relative line numbers
- `<leader>ud` - Toggle diagnostics
- `<leader>ul` - Toggle line numbers

### System
- `<leader>l` - Open Lazy plugin manager
- `<leader>L` - LazyVim changelog
- `<leader>K` - Show keywordprg
- `<leader>qq` - Quit all
- `<leader>?` - Show buffer-local keymaps

## Other Menu Triggers

### Window Commands
- `<C-w>` - Window management commands (split, resize, move, etc.)
- `<C-w><space>` - Window hydra mode menu

### Search/Jump (Flash)
- `s` - Flash jump with labels (shows jump targets)
- `S` - Flash treesitter jump  
- `r` - Flash remote jump
- `R` - Flash treesitter search
- `<C-s>` - Toggle flash search (in command mode)

### Navigation Brackets
- `]` - Next navigation menu
  - `]h` - Next git hunk
  - `]t` - Next todo comment  
  - `]b` - Next buffer
  - `]H` - Last hunk
- `[` - Previous navigation menu
  - `[h` - Previous git hunk
  - `[t` - Previous todo comment
  - `[b` - Previous buffer  
  - `[H` - First hunk

### Buffer Navigation
- `<S-h>` - Previous buffer
- `<S-l>` - Next buffer

## Tips
- Press any prefix key and wait to see the which-key menu popup
- Leader key is `<space>` by default
- Most commands show descriptions in the which-key popup