local Plugin = {}

Plugin.setup = function()
  -- require('copilot').setup()
  require('avante').setup({
    provider = 'copilot',
    model = 'claude-sonnet-4'
  })
end

return Plugin
