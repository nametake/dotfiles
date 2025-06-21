local Plugin = {}

if not pcall(require, 'Comment') then
  Plugin.setup = function() end
  return Plugin
end

Plugin.setup = function()
  require('Comment').setup({
    toggler = {
      line = '<C-_><C-_>',
      block = nil,
    },
    opleader = {
      line = '<C-_><C-_>',
      block = nil,
    },
    mappings = {
      extra = false,
    },
    pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
  })
end

return Plugin
