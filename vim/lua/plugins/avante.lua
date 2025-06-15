local Plugin = {}

local api = require('avante.api')

Plugin.setup = function()
  ---@diagnostic disable-next-line:redundant-parameter
  require('avante').setup({
    provider = 'copilot',
    model = 'claude-sonnet-4',
    mappings = {
      ask = '<C-u>',
      edit = "<Space><C-u>",
      sidebar = {
        close_from_input = {
          normal = "<C-c>",
          insert = "<C-c>",
        },
      },
    },
  })
  vim.keymap.set('n', '<C-u>', api.ask, { noremap = true, silent = true })
  vim.keymap.set('v', '<C-u>', api.ask, { noremap = true, silent = true })

  vim.keymap.set('n', '<C-l>', ':AvanteClear<CR>', { noremap = true, silent = true })
end

return Plugin
