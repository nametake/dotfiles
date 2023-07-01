local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

local Plugin = {}

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

Plugin.setup = function (opts)
  if opts == nil then
    opts = {}
  elseif type(opts) ~= 'table' then
    return
  end

  require("mason").setup()
  require("mason-lspconfig").setup {
    ensure_installed = keys(servers),
  }

  local default_options = {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }

  for lsp, options in pairs(opts.servers) do
    lspconfig[lsp].setup(
      merge(default_options, options)
    )
  end
end

return Plugin
