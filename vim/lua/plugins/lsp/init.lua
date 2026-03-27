local Plugin = {}

local format_on_save_group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = true })

if not pcall(require, 'lspconfig') then
  Plugin.setup = function() end
  return Plugin
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

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
  require('mason-lspconfig').setup({
    automatic_installation = true,
    ensure_installed = keys(opts.servers),
  })

  require "lsp_signature".setup({
    doc_lines = 0,
    max_width = 96,
    max_height = 120,
    hint_enable = false,
    handler_opts = {
      border = "single",
    },
  })

  local default_options = {
    capabilities = capabilities,
  }

  for lsp, options in pairs(opts.servers) do
    -- lspconfig[lsp].setup(
    --   merge(default_options, options)
    -- )
    vim.lsp.config(lsp, merge(default_options, options))
  end

  vim.api.nvim_create_autocmd("BufWritePre", {
    group = format_on_save_group,
    callback = function(args)
      vim.lsp.buf.format({ bufnr = args.buf, async = false, })
    end,
  })

  require("copilot").setup({
    filetypes = {
      ['*'] = true,
    },
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
