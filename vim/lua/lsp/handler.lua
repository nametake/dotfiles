local Plugin = {}

local function decorator(original_handler)
  return function(err, result, ctx, config)
    if vim.islist(result) and #result >= 2 then
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
  vim.diagnostic.config({
    virtual_text = false,
    float = {
      border = 'single',
      width = 96,
    },
  })

  for _, method in ipairs(handlers) do
    local handler = vim.lsp.handlers[method]
    if handler then
      vim.lsp.handlers[method] = decorator(handler)
    end
  end
end

Plugin.hover = function()
  vim.lsp.buf.hover({
    border = 'single',
    width = 96,
  })
end

Plugin.signature_help = function()
  vim.lsp.buf.signature_help({
    border = 'single',
  })
end

Plugin.diagnostic_float = function()
  vim.diagnostic.open_float(nil, {
    border = 'single',
    width = 96,
  })
end

return Plugin
