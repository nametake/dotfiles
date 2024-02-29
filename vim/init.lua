require('global')

-- Load .vimrc
require('vimrc').setup({ path = '/rc/vimrc' })

-- If vim-lsp installed return lsp setting
if (vim.fn.IsPlugged('nvim-lspconfig') ~= 1) then
  return
end

require('lsp.handler').setup()

require('plugins.init').setup()

local util = require('lspconfig.util')
require('plugins.lsp.init').setup({
  -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md --
  servers = {
    -- efm-langserver
    efm = {},
    -- Go
    gopls = {
      init_options = {
        symbolScope = 'workspace',
      },
      staticcheck = true,
      gofumpt = true,
      env = {
        GOEXPERIMENT = "rangefunc",
      },
    },
    golangci_lint_ls = {
      init_options = {
        command = { "golangci-lint", "run", "--out-format", "json" },
      },
    },
    -- GraphQL
    graphql = {
      root_dir = util.root_pattern('.git', '.graphqlrc*', '.graphql.config.*', 'graphql.config.*', '.graphqlconfig*')
    },
    -- Kotlin
    kotlin_language_server = {},
    -- TypeScript
    tsserver = {},
    biome = {},
    tailwindcss = {},
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
    -- Protocol Buffers
    bufls = {},
    -- YAML
    yamlls = {},
    -- Vim
    vimls = {},
  }
})

require('plugins.lsp.keymap').setup()
require('plugins.nvim-treesitter').setup()
require('plugins.telescope').setup()
require('plugins.comment').setup()
