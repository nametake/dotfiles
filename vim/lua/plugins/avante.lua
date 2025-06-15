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

  -- https://github.com/yetone/avante.nvim/issues/2144
  -- Close all floating windows
  local function close_floating_windows()
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      local success, config = pcall(vim.api.nvim_win_get_config, win)
      if success and config.relative ~= '' then
        pcall(vim.api.nvim_win_close, win, true)
      end
    end
  end

  -- Create user command
  vim.api.nvim_create_user_command('CloseFloatingWindows', close_floating_windows, {
    desc = 'Close all floating windows'
  })
end

return Plugin
