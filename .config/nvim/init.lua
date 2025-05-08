vim.opt.compatible = false
vim.opt.encoding = 'utf-8'
vim.cmd('filetype plugin indent on')

require('config.packer')
require('config.set')
require('config.remap')
require('config.cmds')
