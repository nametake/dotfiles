local Plugin = {}

local api = require('avante.api')

Plugin.setup = function()
  require('avante').setup({
    provider = 'copilot',
    model = 'claude-sonnet-4',
    mappings = {
      ask = '<C-u>',
      edit = "<Space><C-u>",
    },
  })
  vim.keymap.set('n', '<C-u>', api.ask, { noremap = true, silent = true })
  vim.keymap.set('v', '<C-u>', api.ask, { noremap = true, silent = true })

  vim.keymap.set('n', '<C-l>', ':AvanteClear<CR>', { noremap = true, silent = true })
end

return Plugin
