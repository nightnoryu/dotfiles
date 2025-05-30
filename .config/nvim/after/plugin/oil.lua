require('oil').setup({
  view_options = {
    show_hidden = true,
  },
})
vim.api.nvim_set_keymap('n', '-', '<CMD>Oil<CR>', { silent = true })
