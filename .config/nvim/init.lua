vim.opt.compatible = false
vim.opt.encoding = 'utf-8'
vim.cmd('filetype plugin indent on')

require('config.packer')
require('config.set')
require('config.remap')

local settings = vim.api.nvim_create_augroup('settings', { clear = true })

vim.opt.autoread = true
vim.api.nvim_create_autocmd({'FocusGained', 'BufEnter'}, {
  group = settings,
  command = 'checktime',
})

vim.api.nvim_create_autocmd('VimResized', {
  group = settings,
  command = 'wincmd=',
})

vim.api.nvim_create_autocmd('FileType', {
  group = settings,
  pattern = { 'help', 'qf', 'fugitive', 'fugitiveblame' },
  callback = function(args)
    vim.api.nvim_buf_set_keymap(args.buf, 'n', 'q', ':close<CR>', { noremap = true, silent = true })
  end
})

vim.api.nvim_set_keymap('i', '<C-j>', '<C-^>', {})
vim.opt.keymap = 'russian-jcukenwin'
vim.opt.iminsert = 0
vim.opt.imsearch = 0
vim.api.nvim_create_autocmd('InsertLeave', {
  group = settings,
  callback = function()
    vim.opt.iminsert = 0
  end
})

vim.cmd [[
function! CleanTrailings() abort
  let save_cursor = getpos('.')
  let old_query = getreg('/')
  " Trailing whitespaces
  silent! %s/\s\+$//e
  " Blank lines at EOF
  silent! %s#\($\n\s*\)\+\%$##
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
command! CleanTrailings call CleanTrailings()
]]

vim.cmd [[
function! Sort(type, ...)
  '[,']sort
endfunction
nnoremap <silent> gs :set opfunc=Sort<CR>g@
]]

vim.api.nvim_create_autocmd('FileType', {
  group = settings,
  callback = function()
  -- Turn off automatic text wrapping (both text and comments)
  vim.cmd 'setlocal formatoptions-=tc'
  -- Turn off automatic comment insertion
  vim.cmd 'setlocal formatoptions-=ro'
  -- Preserve short lines and don't break words when formatting
  vim.opt_local.formatoptions:append('w')
  -- Recognize numbered lists when formating
  vim.opt_local.formatoptions:append('n')
  -- Don't break a line after a one-letter word when formatting
  vim.opt_local.formatoptions:append('1')
  -- Remove comment leader when joining lines with comments
  vim.opt_local.formatoptions:append('j')
  -- Don't break lines at single spaces that follow periods
  vim.opt_local.formatoptions:append('p')
  end
})
