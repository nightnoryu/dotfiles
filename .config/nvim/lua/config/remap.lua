vim.g.mapleader = ' '

vim.keymap.set('n', 'Q', '<nop>')

vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Up>', ':resize +2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Down>', ':resize -2<CR>', { noremap = true, silent = true })

vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'J', 'v:count ? \'J\' : \'mzJ`z\'', { expr = true })

vim.keymap.set('n', '<leader>y', '\"+y')
vim.keymap.set('v', '<leader>y', '\"+y')

vim.cmd [[
function! Sort(type, ...)
  '[,']sort
endfunction
nnoremap <silent> gs :set opfunc=Sort<CR>g@
]]

vim.keymap.set('i', '<C-j>', '<C-^>')
