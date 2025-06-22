local Plugin = {}

if not pcall(require, 'codecompanion') then
  Plugin.setup = function() end
  return Plugin
end

Plugin.setup = function()
  require('codecompanion').setup({})
end

return Plugin
