local Plugin = {}

if not pcall(require, 'codecompanion') then
  Plugin.setup = function() end
  return Plugin
end

Plugin.setup = function()
  local mcphub_available = pcall(require, 'mcphub')
  require("mcphub").setup()

  --- @diagnostic disable-next-line:redundant-parameter
  require('codecompanion').setup({
    strategies = {
      chat = {
        adapter = {
          name = "copilot",
          model = "claude-sonnet-4",
        },
        tools = {
          opts = {
            default_tools = {
              "full_stack_dev",
              "mcp",
            },
          },
        },
      },
    },
    -- opts = {
    --   system_prompt = function()
    --     if mcphub_available then
    --       local hub = require("mcphub").get_hub_instance()
    --       return hub and hub:get_active_servers_prompt() or ""
    --     end
    --     return ""
    --   end,
    -- },
    -- tools = {
    --   ["python"] = false,
    --   ["bash"] = false,
    -- },
    display = {
      chat = {
        window = {
          layout = "vertical",
          width = 0.3,
        },
      },
    },
    extensions = {
      mcphub = {
        callback = "mcphub.extensions.codecompanion",
        opts = {
          show_result_in_chat = true, -- Show mcp tool results in chat
          make_vars = true,           -- Convert resources to #variables
          make_slash_commands = true, -- Add prompts as /slash commands
        },
      },
    },
    opts = {
      language = "Japanese",
    },
  })

  -- Configure keymaps to match Avante's keybindings
  vim.keymap.set({ "n", "v" }, "<C-u>", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
  vim.keymap.set({ "n", "v" }, "<Space><C-u>", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })
  -- vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })
  vim.keymap.set("n", "<Space>s", "<cmd>CodeCompanionChat Stop<cr>", { noremap = true, silent = true })
  vim.keymap.set("n", "<C-l>", "<cmd>CodeCompanionChat Clear<cr>", { noremap = true, silent = true })
  vim.keymap.set("i", "<C-l>", "<Esc><cmd>CodeCompanionChat Clear<cr>", { noremap = true, silent = true })
end

return Plugin
