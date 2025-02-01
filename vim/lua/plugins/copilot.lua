local Plugin = {}

local chat = require 'CopilotChat'

local function show_copilot_chat_action_prompt()
  local actions = require('CopilotChat.actions')
  require('CopilotChat.integrations.telescope').pick(actions.prompt_actions())
end


Plugin.setup = function()
  chat.setup {
    prompts = {
      Explain = {
        prompt = "/COPILOT_EXPLAIN 選択したコードを日本語で説明してください。",
      },
      Review = {
        prompt = "/COPILOT_REVIEW 選択したコードを日本語でレビューしてください。",
      },
      Fix = {
        prompt = "/COPILOT_FIX このコードには問題があります。バグを修正してください。",
      },
      Refactor = {
        prompt = "/COPILOT_REFACTOR 選択した読みやすくしてください。",
      },
      Optimize = {
        prompt = "/COPILOT_REFACTOR 選択したコードを最適化し、パフォーマンスと可読性を向上させてください。",
      },
      Docs = {
        prompt = "/COPILOT_DOCS 選択したコードに対して日本語のドキュメントコメントを追加してください。",
      },
      Tests = {
        prompt = "/COPILOT_TESTS 選択したコードの詳細な単体テスト関数を日本語で作成してください。",
      },
    },
  }

  vim.keymap.set('n', '<C-n>', chat.open, { noremap = true, silent = true })
  vim.keymap.set('v', '<C-n>', chat.open, { noremap = true, silent = true })
  vim.keymap.set('n', '<C-m>', show_copilot_chat_action_prompt, { noremap = true, silent = true })
  vim.keymap.set('v', '<C-m>', show_copilot_chat_action_prompt, { noremap = true, silent = true })
end

return Plugin
