local actions = require('telescope.actions')

local Plugin = {}

Plugin.setup = function()
  require('telescope').setup {
    defaults = {
      mappings = {
        i = {
          ["<ESC>"] = actions.close,
          ["<C-[>"] = actions.close,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-f>"] = function()
            vim.api.nvim_feedkeys(t('<Right>'), 'i', false)
          end,
          ["<C-b>"] = function()
            vim.api.nvim_feedkeys(t('<Left>'), 'i', false)
          end,
          ["<C-e>"] = function()
            local col = string.len(vim.api.nvim_get_current_line())
            local row = table.unpack(vim.api.nvim_win_get_cursor(0))
            vim.api.nvim_win_set_cursor(0, { row, col })
          end,
          ["<C-a>"] = function()
            local row = table.unpack(vim.api.nvim_win_get_cursor(0))
            vim.api.nvim_win_set_cursor(0, { row, 0 })
          end,
          ["<C-h>"] = function()
            vim.api.nvim_feedkeys(t('<BS>'), 'i', false)
          end,
          ["<C-d>"] = function()
            vim.api.nvim_feedkeys(t('<DEL>'), 'i', false)
          end,
        },
      },
    },
  }
  require('telescope').load_extension('fzf')
end

return Plugin
