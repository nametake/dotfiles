local Plugin = {}

Plugin.setup = function()
  local ok, nvim_autopairs = pcall(require, "nvim-autopairs")
  if ok then
    nvim_autopairs.setup()
  end


  require("nvim-autopairs").setup()
  -- https://github.com/phaazon/hop.nvim/issues/46
  -- require("hop").setup()
  -- require("symbols-outline").setup({
  --   auto_close = true,
  --   symbols = {
  --     File = { icon = "", hl = "@text.uri" },
  --     Module = { icon = "", hl = "@namespace" },
  --     Namespace = { icon = "", hl = "@namespace" },
  --     Package = { icon = "", hl = "@namespace" },
  --     Class = { icon = "𝓒", hl = "@type" },
  --     Method = { icon = "ƒ", hl = "@method" },
  --     Property = { icon = "", hl = "@method" },
  --     Field = { icon = "F", hl = "@field" },
  --     Constructor = { icon = "", hl = "@constructor" },
  --     Enum = { icon = "ℰ", hl = "@type" },
  --     Interface = { icon = "ﰮ", hl = "@type" },
  --     Function = { icon = "", hl = "@function" },
  --     Variable = { icon = "", hl = "@constant" },
  --     Constant = { icon = "", hl = "@constant" },
  --     String = { icon = "𝓐", hl = "@string" },
  --     Number = { icon = "#", hl = "@number" },
  --     Boolean = { icon = "⊨", hl = "@boolean" },
  --     Array = { icon = "", hl = "@constant" },
  --     Object = { icon = "⦿", hl = "@type" },
  --     Key = { icon = "🔐", hl = "@type" },
  --     Null = { icon = "NULL", hl = "@type" },
  --     EnumMember = { icon = "", hl = "@field" },
  --     Struct = { icon = "𝓢", hl = "@type" },
  --     Event = { icon = "🗲", hl = "@type" },
  --     Operator = { icon = "+", hl = "@operator" },
  --     TypeParameter = { icon = "𝙏", hl = "@parameter" },
  --     Component = { icon = "", hl = "@function" },
  --     Fragment = { icon = "", hl = "@constant" },
  --   },
  -- })
end

return Plugin
