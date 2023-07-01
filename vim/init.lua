-- Load .vimrc
require("vimrc").setup({ path = "/rc/vimrc" })

-- If vim-lsp installed return lsp setting
if (vim.fn.IsPlugged('nvim-lspconfig') ~= 1) then
  return
end

require("lsp_handler").setup()
require("lsp_init").setup({
  servers = {
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
})

require("keymap").setup()
