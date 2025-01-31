local Plugin = {}

Plugin.setup = function()
  require("CopilotChat").setup {
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
end

return Plugin
