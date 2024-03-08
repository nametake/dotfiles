local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

local Plugin = {}

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
  local keyset = {}
  local n = 0

  for k, _ in pairs(list) do
    n = n + 1
    keyset[n] = k
  end
  return keyset
end

Plugin.setup = function(opts)
  if opts == nil then
    opts = {}
  elseif type(opts) ~= 'table' then
    return
  end

  require('mason').setup()
  require('mason-lspconfig').setup {
    ensure_installed = keys(opts.servers),
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

  -- https://github.com/golang/tools/blob/master/gopls/doc/vim.md#neovim-imports
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
      local params = vim.lsp.util.make_range_params()
      params.context = { only = { "source.organizeImports" } }
      -- buf_request_sync defaults to a 1000ms timeout. Depending on your
      -- machine and codebase, you may want longer. Add an additional
      -- argument after params if you find that you have to write the file
      -- twice for changes to be saved.
      -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
      local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
      for cid, res in pairs(result or {}) do
        for _, r in pairs(res.result or {}) do
          if r.edit then
            local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
            vim.lsp.util.apply_workspace_edit(r.edit, enc)
          end
        end
      end
      vim.lsp.buf.format({ async = false })
    end
  })

  require("copilot").setup({
    suggestion = { enabled = false },
    panel = { enabled = false },
  })
  require("copilot_cmp").setup()

  -- https://www.reddit.com/r/neovim/comments/u5i16v/how_to_disable_diagnostics_for_env_file/
  vim.cmd([[
    augroup _env
    autocmd!
    autocmd BufEnter .env lua vim.diagnostic.disable(0)
    augroup end
  ]])
end

return Plugin
