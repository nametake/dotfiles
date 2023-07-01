local Plugin = {}

Plugin.setup = function (opts)
  if opts == nil then
    opts = {}
  elseif type(opts) ~= 'table' then
    return
  end

  local vimrc = vim.fn.stdpath('config') .. opts.path
  vim.cmd.source(vimrc)
end

return Plugin
