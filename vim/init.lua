require('global')

-- Load .vimrc
require('vimrc').setup({ path = '/rc/vimrc' })

-- If vim-lsp installed return lsp setting
if (vim.fn.IsPlugged('nvim-lspconfig') ~= 1) then
  return
end

require('lsp.handler').setup()

require('plugins.init').setup()

require('plugins.lsp.init').setup({
  -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md --
  servers = {
    -- All files
    efm = {},
    typos_lsp = {
      init_options = {
        diagnosticSeverity = "Hint"
      }
    },
    -- Go
    gopls = {
      -- init_options = {
      --   symbolScope = 'workspace',
      -- },
      -- staticcheck = true,
      -- gofumpt = true,
      -- analyses = {
      --   unusedparams = false,
      -- },
      -- env = {
      --   GOEXPERIMENT = "rangefunc",
      -- },
    },
    golangci_lint_ls = {
      init_options = {
        command = { "golangci-lint", "run", "--allow-parallel-runners", "--out-format", "json" },
      },
    },
    -- GraphQL
    graphql = {},
    -- Kotlin
    kotlin_language_server = {},
    -- TypeScript
    -- https://github.com/neovim/nvim-lspconfig/pull/3232
    -- tsserver = {},
    vtsls = {},
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
    -- bufls = {},
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
require("CopilotChat").setup {
  prompts = {
    Explain = {
      prompt = "/COPILOT_EXPLAIN 選択したコードを日本語で説明してください。",
    },
    Review = {
      prompt = "/COPILOT_REVIEW 選択したコードを日本語でレビューしてください。",
    },
    Fix = {
      prompt = "/COPILOT_FIX このコードには問題があります。バグを修正してください。",
    },
    Optimize = {
      prompt = "/COPILOT_REFACTOR 選択したコードを最適化し、パフォーマンスと可読性を向上させてください。",
    },
    Docs = {
      prompt = "/COPILOT_DOCS 選択したコードに対して日本語のドキュメントコメントを追加してください。",
    },
    Tests = {
      prompt = "/COPILOT_TESTS 選択したコードの詳細な単体テスト関数を日本語で作成してください。",
    },
  },
}
