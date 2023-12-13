local Plugin = {}

Plugin.setup = function()
  require("nvim-autopairs").setup()
  -- https://github.com/phaazon/hop.nvim/issues/46
  -- require("hop").setup()
end

return Plugin
