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

  local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
  parser_config.bruno = {
    install_info = {
      url = "https://github.com/Scalamando/tree-sitter-bruno",
      files = { 'src/parser.c', 'src/scanner.c' },
      branch = "main", -- default branch in case of git repo if different from master
      -- generate_requires_npm = true,          -- if stand-alone parser without npm dependencies
      -- requires_generate_from_grammar = true, -- if folder contains pre-generated src/parser.c
    },
    filetype = "bruno",
  }
end

return Plugin
