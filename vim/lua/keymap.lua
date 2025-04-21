local Plugin = {}

Plugin.setup = function()
  local function focus_first_float()
    local win_list = vim.api.nvim_tabpage_list_wins(0)
    for _, win_id in ipairs(win_list) do
      local config = vim.api.nvim_win_get_config(win_id)
      if config.relative ~= "" then
        vim.api.nvim_set_current_win(win_id)
        return
      end
    end
    print("No floating window found.")
  end

  vim.keymap.set("n", "<C-w><C-f>", focus_first_float, { noremap = true, silent = true })
end

return Plugin
