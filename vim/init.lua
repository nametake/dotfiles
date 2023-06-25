-- Load .vimrc {{{
local vimrc = vim.fn.stdpath("config") .. "/rc/vimrc"
vim.cmd.source(vimrc)
-- }}}

-- If vim-lsp installed return lsp setting
if (vim.fn.IsPlugged('vim-lsp') == 1) then
  return
end

-- for tagstack at multi result
local function decorator(original_handler)
  return function(err, result, ctx, config)
    if vim.tbl_islist(result) then
      local from = { vim.fn.bufnr('%'), vim.fn.line('.'), vim.fn.col('.'), 0 }
      local items = { { tagname = vim.fn.expand('<cword>'), from = from } }
      vim.fn.settagstack(vim.fn.win_getid(), { items = items }, 't')
    end
    return original_handler(err, result, ctx, config)
  end
end

local handlers = {
    "textDocument/declaration",
    "textDocument/definition",
    "textDocument/typeDefinition",
    "textDocument/implementation",
  }

for _, attribute in ipairs(handlers) do
  vim.lsp.handlers[attribute] = decorator(vim.lsp.handlers[attribute])
end

-- LSP setting
require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = {
    -- efm-langserver
    "efm",
    "lua_ls",
    "rust_analyzer",
    "gopls",
    "tsserver",
  },
}

local lspconfig = require('lspconfig')
lspconfig.efm.setup {}
lspconfig.gopls.setup {}
lspconfig.tsserver.setup {}

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
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
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
