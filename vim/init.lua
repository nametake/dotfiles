-- Load .vimrc
require('vimrc').setup({ path = '/rc/vimrc' })

-- If vim-lsp installed return lsp setting
if (vim.fn.IsPlugged('nvim-lspconfig') ~= 1) then
  return
end

require('lsp_handler').setup()
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
    graphql = {},
    -- TypeScript
    tsserver = {},
    -- Bash
    bashls = {},
    -- Lua
    lua_ls = {
      settings = {
        Lua = {
          diagnostics = {
            globals = {'vim'},
          },
        },
      },
    },
    -- Markdown
    marksman = {},
    -- Rust
    rust_analyzer = {},
  }
})

require('keymap').setup()
