require('global')

-- Load .vimrc
require('vimrc').setup({ path = '/rc/vimrc' })

-- If vim-lsp installed return lsp setting
if (vim.fn.IsPlugged('nvim-lspconfig') ~= 1) then
  return
end

require('lsp_handler').setup()

local util = require('lspconfig.util')
require('lsp_init').setup({
  -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md --
  servers = {
    -- efm-langserver
    efm = {},
    -- Go
    gopls = {
      init_options = {
        symbolScope = 'workspace',
        memoryMode = 'DegradeClosed',
      },
    },
    golangci_lint_ls = {
      init_options = {
        command = { "golangci-lint", "run", "--out-format", "json", "--enable-all" },
      },
    },
    -- GraphQL
    graphql = {
      root_dir = util.root_pattern('.git', '.graphqlrc*', '.graphql.config.*', 'graphql.config.*', '.graphqlconfig*')
    },
    -- TypeScript
    tsserver = {},
    rome = {},
    -- Bash
    bashls = {},
    -- Lua
    lua_ls = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
    },
    -- Markdown
    marksman = {},
    -- Rust
    rust_analyzer = {},
    -- Vim
    vimls = {},
  }
})

require('lsp_config').setup()
require('telescope_config').setup()
require('comment_config').setup()
