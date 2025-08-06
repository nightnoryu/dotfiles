local lspconfig = require('lspconfig')
local util = require('lspconfig.util')
local cmp = require('cmp')
local cmp_caps = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(client, bufnr)
  local opts = { silent = true }
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  buf_set_keymap('n', 'K', ':lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gls', ':lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '[e',  ':lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']e',  ':lua vim.diagnostic.goto_next()<CR>', opts)

  buf_set_keymap('n', 'glD', ':lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gld', ':lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gli', ':lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'glR', ':lua vim.lsp.buf.references()<CR>', opts)

  buf_set_keymap('n', 'glf', ':lua vim.lsp.buf.format()<CR>', opts)
  buf_set_keymap('n', 'gla', ':lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'glr', ':lua vim.lsp.buf.rename()<CR>', opts)
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

cmp.setup({
  sources = cmp.config.sources({
    { name = 'nvim_lsp' }
  }, {
    { name = 'buffer' }
  }),
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
})
