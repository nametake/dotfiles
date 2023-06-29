-- Load .vimrc {{{
local vimrc = vim.fn.stdpath("config") .. "/rc/vimrc"
vim.cmd.source(vimrc)
-- }}}

-- If vim-lsp installed return lsp setting
if (vim.fn.IsPlugged('vim-lsp') == 1) then
  return
end

require("location_handler").setup()

-- LSP setting
local servers = {
  -- efm-langserver
  efm = {},
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = {'vim'},
        },
      },
    },
  },
  rust_analyzer = {},
  gopls = {},
  tsserver = {},
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

local function merge(list1, list2)
  local result = {}
  for key, value in pairs(list1) do
    result[key] = value
  end
  for key, value in pairs(list2) do
    result[key] = value
  end

  return result
end

local function keys(list)
  local keyset={}
  local n=0

  for k, _ in pairs(list) do
    n=n+1
    keyset[n]=k
  end
  return keyset
end

require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = keys(servers),
}

local default_options = {
  -- on_attach = my_custom_on_attach,
  capabilities = capabilities,
}

for lsp, options in pairs(servers) do
  lspconfig[lsp].setup(
    merge(default_options, options)
  )
end

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<space>k', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<space>j', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>r', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, ';', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wl', function()
    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, opts)
  end,
})

local cmp = require'cmp'
local feedkeys = require'cmp.utils.feedkeys'

local t = function (str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local function smart_confirm(fallback)
  if vim.fn['vsnip#available'](1) == 1 then
    feedkeys.call(t'<Plug>(vsnip-expand-or-jump)', '')
  elseif cmp.visible() then
    cmp.confirm({ select = true })
  else
    fallback()
  end
end

cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-k>'] = cmp.mapping(smart_confirm),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }
  }, {
      { name = 'buffer' },
    }),
  preselect = cmp.PreselectMode.None
}
