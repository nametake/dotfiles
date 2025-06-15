local Plugin = {}

Plugin.setup = function()
  -- require('copilot').setup()
  require('avante').setup({
    provider = 'copilot',
  })
end

return Plugin
