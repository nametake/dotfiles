local actions = require('telescope.actions')
local lga_actions = require("telescope-live-grep-args.actions")

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
    pickers = {
      git_files = {
        push_tagstack_on_edit = true,
      },
      buffers = {
        push_tagstack_on_edit = true,
      },
      diagnostics = {
        push_tagstack_on_edit = true,
      },
    },
    extensions = {
      live_grep_args = {
        auto_quoting = true,
        mappings = {
          i = {
            ["<C-r>"] = lga_actions.quote_prompt({ postfix = ' -g ' }),
          },
        },
        push_tagstack_on_edit = true,
      },
    },
  }
  require('telescope').load_extension('fzf')
end

return Plugin
