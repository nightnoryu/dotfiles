local settings = vim.api.nvim_create_augroup('settings', { clear = true })

-- Audomatically reload file changes
vim.opt.autoread = true
vim.api.nvim_create_autocmd({'FocusGained', 'BufEnter'}, {
  group = settings,
  command = 'checktime',
})

-- Automatically resize windows
vim.api.nvim_create_autocmd('VimResized', {
  group = settings,
  command = 'wincmd=',
})

-- Russian keymap
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

-- Simple sort motion
vim.cmd [[
function! Sort(type, ...)
  '[,']sort
endfunction
nnoremap <silent> gs :set opfunc=Sort<CR>g@
]]

vim.api.nvim_create_autocmd('FileType', {
  group = settings,
  callback = function()
  -- Turn off automatic text wrapping
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
