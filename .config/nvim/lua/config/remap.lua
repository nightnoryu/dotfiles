vim.g.mapleader = ' '

vim.api.nvim_set_keymap('n', 'Q', '<nop>', {})

vim.api.nvim_set_keymap('n', '<MiddleMouse>', '<nop>', { silent = true })
vim.api.nvim_set_keymap('i', '<MiddleMouse>', '<nop>', { silent = true })

-- Center the screen on certain actions in order not to get lost
vim.api.nvim_set_keymap('n', 'n', 'nzzzv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'J', 'v:count ? \'J\' : \'mzJ`z\'', { noremap = true, silent = true, expr = true })

-- Intuitive line movement (if count is not provided, move by displayed lines)
vim.api.nvim_set_keymap('n', 'j', 'v:count ? \'j\' : \'gj\'', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('n', 'k', 'v:count ? \'k\' : \'gk\'', { noremap = true, silent = true, expr = true })

-- Copy and paste using system clipboard
vim.api.nvim_set_keymap('n', '<leader>y', '\"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>y', '\"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>p', '\"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>p', '\"+p', { noremap = true, silent = true })

-- Change and delete to blackhole register
vim.api.nvim_set_keymap('n', 'c', '\"_c', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'c', '\"_c', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'C', '\"_C', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'x', '\"_x', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'x', '\"_x', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'X', '\"_X', { noremap = true, silent = true })

-- Faster movement between windows
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Window resizing with arrow keys
vim.api.nvim_set_keymap('n', '<Right>', ':vertical resize +2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Left>', ':vertical resize -2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Up>', ':resize +2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Down>', ':resize -2<CR>', { noremap = true, silent = true })
