local lspconfig = require('lspconfig')
local util = require('lspconfig.util')
local lsp_signature = require('lsp_signature')
local cmp_caps = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  lsp_signature.on_attach({
    bind = true,
    doc_lines = 2,

    floating_window = true,
    hint_enable = true,
    hint_prefix = '🌟 ',
    hint_scheme = 'String',
    use_lspsaga = false,
    hi_parameter = 'Search',
    max_height = 12,
    max_width = 120,
    handler_opts = {
      border = 'single',
    },
    extra_trigger_chars = {},
  }, bufnr)

  local opts = { noremap = true, silent = true }

  buf_set_keymap('n', 'gla', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'glD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gld', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gli', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gls', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', 'gle', '<cmd>lua vim.diagnostic.get()<CR>', opts)
  buf_set_keymap('n', 'glt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', 'glr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'glR', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '[e',  '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']e',  '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

  vim.cmd("command! -buffer Format execute 'lua vim.lsp.buf.format()'")
end

lspconfig.gopls.setup({
  on_attach = on_attach,
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  root_dir = util.root_pattern('go.work', 'go.mod', '.git'),
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = cmp_caps,
})

lspconfig.pylsp.setup({
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = cmp_caps,
})
