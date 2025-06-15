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
          normal = { "<C-c>", "q" },
          insert = "<C-c>",
        },
      },
    },
    windows = {
      sidebar_header = {
        rounded = false,
      },
    },
  })
  vim.keymap.set('n', '<C-u>', api.ask, { noremap = true, silent = true })
  vim.keymap.set('v', '<C-u>', api.ask, { noremap = true, silent = true })

  vim.keymap.set('n', '<C-l>', ':AvanteClear<CR>', { noremap = true, silent = true })

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "Avante",
    callback = function()
      vim.opt_local.foldmethod = "manual"
    end,
  })
end

return Plugin
