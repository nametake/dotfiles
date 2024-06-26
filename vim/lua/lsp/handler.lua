local Plugin = {}

-- for tagstack at multi result
local function decorator(original_handler)
  return function(err, result, ctx, config)
    if vim.tbl_islist(result) and table.getn(result) >= 2 then
      local from = { vim.fn.bufnr('%'), vim.fn.line('.'), vim.fn.col('.'), 0 }
      local items = { { tagname = vim.fn.expand('<cword>'), from = from } }
      vim.fn.settagstack(vim.fn.win_getid(), { items = items }, 't')
    end
    return original_handler(err, result, ctx, config)
  end
end

local handlers = {
  'textDocument/declaration',
  'textDocument/definition',
  'textDocument/typeDefinition',
  'textDocument/implementation',
  'textDocument/references',
}

Plugin.setup = function()
  -- Change to use https://github.com/lukas-reineke/lsp-format.nvim
  -- vim.api.nvim_create_autocmd("BufWritePre", {
  --   callback = function()
  --     vim.lsp.buf.format { async = false }
  --   end
  -- })

  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover,
    {
      border = 'single',
      width = 96,
    }
  )

  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help, {
      border = 'single'
    }
  )

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
  )

  for _, attribute in ipairs(handlers) do
    vim.lsp.handlers[attribute] = decorator(vim.lsp.handlers[attribute])
  end
end

return Plugin
