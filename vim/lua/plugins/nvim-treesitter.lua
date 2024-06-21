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

    require 'treesitter-context'.setup {
        enable = true,            -- Enable this plugin (Can be enabled/disabled later via commands)
        max_lines = 0,            -- How many lines the window should span. Values <= 0 mean no limit.
        min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        line_numbers = true,
        multiline_threshold = 20, -- Maximum number of lines to show for a single context
        trim_scope = 'outer',     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        mode = 'cursor',          -- Line used to calculate context. Choices: 'cursor', 'topline'
        -- Separator between context and content. Should be a single character string, like '-'.
        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
        separator = nil,
        zindex = 20,     -- The Z-index of the context window
        on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
    }

    require('nvim-ts-autotag').setup()
end

return Plugin
