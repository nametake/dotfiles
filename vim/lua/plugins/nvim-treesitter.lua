local Plugin = {}

Plugin.setup = function()
  require 'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    ignore_install = { "phpdoc" },
    highlight = {
      enable = true, -- false will disable the whole extension
      -- disable = { "html" },
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
    },
    autotag = {
      enable = true,
    },
  }
end

return Plugin
