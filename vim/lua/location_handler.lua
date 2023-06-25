Plugin = {}

-- for tagstack at multi result
local function decorator(original_handler)
  return function(err, result, ctx, config)
    if vim.tbl_islist(result) then
      local from = { vim.fn.bufnr('%'), vim.fn.line('.'), vim.fn.col('.'), 0 }
      local items = { { tagname = vim.fn.expand('<cword>'), from = from } }
      vim.fn.settagstack(vim.fn.win_getid(), { items = items }, 't')
    end
    return original_handler(err, result, ctx, config)
  end
end

local handlers = {
  "textDocument/declaration",
  "textDocument/definition",
  "textDocument/typeDefinition",
  "textDocument/implementation",
}


Plugin.setup = function ()
  for _, attribute in ipairs(handlers) do
    vim.lsp.handlers[attribute] = decorator(vim.lsp.handlers[attribute])
  end

end

return Plugin
