local Plugin = {}

local api = require('avante.api')

Plugin.setup = function()
  ---@diagnostic disable-next-line:redundant-parameter
  require('avante').setup({
    provider = 'copilot',
    providers = {
      copilot = {
        model = 'claude-sonnet-4',
      },
    },
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
    disabled_tools = {
      -- "rag_search",
      "python",
      -- "git_diff",
      -- "git_commit",
      -- "list_files",
      -- "search_files",
      -- "search_keyword",
      -- "read_file_toplevel_symbols",
      -- "read_file",
      -- "create_file",
      -- "rename_file",
      -- "delete_file",
      -- "create_dir",
      -- "rename_dir",
      -- "delete_dir",
      "bash",
      -- "web_search",
      -- "fetch",
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
  vim.keymap.set('i', '<C-l>', '<Esc>:AvanteClear<CR>', { noremap = true, silent = true })

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "Avante",
    callback = function()
      vim.opt_local.foldmethod = "manual"
    end,
  })
end

return Plugin
