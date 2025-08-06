vim.opt.updatetime = 50
vim.opt.lazyredraw = true
vim.opt.swapfile = false

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.background = 'dark'
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.winborder = 'rounded'

vim.opt.smartindent = true
vim.opt.copyindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = -1
vim.opt.shiftround = true

vim.opt.wrap = false
vim.opt.scrolloff = 5

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.cmdheight = 2
vim.opt.showmode = false
vim.opt.confirm = true

vim.opt.wildmode = 'longest,list,full'
vim.opt.wildignorecase = true
vim.opt.completeopt = 'menuone,noselect'
vim.opt.shortmess:append('c')

vim.opt.diffopt:append('internal,algorithm:patience')

vim.opt.keymap = 'russian-jcukenwin'
vim.opt.spelllang = 'en_us,ru_yo'
vim.opt.iminsert = 0
