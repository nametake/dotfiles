local cmp = require 'cmp'
local feedkeys = require 'cmp.utils.feedkeys'

local Plugin = {}

local function confirm_smart(fallback)
  if vim.fn['vsnip#jumpable'](1) == 1 then
    if cmp.get_selected_entry() then
      cmp.confirm({ select = true })
    end
    feedkeys.call(t '<Plug>(vsnip-jump-next)', '')
  elseif cmp.get_selected_entry() then
    cmp.confirm({ select = true })
  else
    fallback()
  end
end

local function jump_prev(fallback)
  if vim.fn['vsnip#jumpable'](-1) == 1 then
    feedkeys.call(t '<Plug>(vsnip-jump-prev)', '')
  else
    fallback()
  end
end

Plugin.setup = function()
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
    callback = function(ev) -- Enable completion triggered by <c-x><c-o>
      vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local opts = { buffer = ev.buf }
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
      vim.keymap.set('n', '<space>r', vim.lsp.buf.rename, opts)
      vim.keymap.set({ 'n', 'v' }, ';', vim.lsp.buf.code_action, opts)
      -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      -- vim.keymap.set('n', 'gD', vim.lsp.buf.type_definition, opts)
      -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts) -- for telescope
      -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
      -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
      -- vim.keymap.set('n', '<space>wl', function()
      --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      -- end, opts)
    end,
  })

  cmp.setup {
    snippet = {
      expand = function(args)
        vim.fn['vsnip#anonymous'](args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<Tab>'] = cmp.mapping.select_next_item(),
      ['<S-Tab>'] = cmp.mapping.select_prev_item(),
      ['<CR>'] = cmp.mapping(confirm_smart, { 'i', 's' }),
      ['<C-k>'] = cmp.mapping(confirm_smart, { 'i', 's' }),
      ['<C-j>'] = cmp.mapping(jump_prev, { 'i', 's' }),
    }),
    sources = cmp.config.sources({
      -- { name = 'buffer' },
      { name = "copilot",                group_index = 2 },
      { name = 'path' },
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
      { name = 'nvim_lsp_signature_help' },
    }, {
      { name = 'buffer' },
    }),
    preselect = cmp.PreselectMode.None
  }

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
end

return Plugin
