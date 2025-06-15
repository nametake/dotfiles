local Plugin = {}

Plugin.setup = function()
  --- @diagnostic disable-next-line:redundant-parameter
  require("neo-tree").setup({
    use_default_mappings = false,
    window = {
      mappings = {
        -- ["<space>"] = {
        --   "toggle_node",
        --   nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
        -- },
        -- ["<2-LeftMouse>"] = "open",
        -- ["<cr>"] = "open",
        -- ["<esc>"] = "cancel", -- close preview or floating neo-tree window
        -- ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
        -- Read `# Preview Mode` for more information
        -- ["l"] = "focus_preview",
        -- ["S"] = "open_split",
        -- ["s"] = "open_vsplit",
        -- ["S"] = "split_with_window_picker",
        -- ["s"] = "vsplit_with_window_picker",
        -- ["t"] = "open_tabnew",
        -- ["<cr>"] = "open_drop",
        -- ["t"] = "open_tab_drop",
        -- ["w"] = "open_with_window_picker",
        --["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
        -- ["C"] = "close_node",
        -- ['C'] = 'close_all_subnodes',
        -- ["z"] = "close_all_nodes",
        --["Z"] = "expand_all_nodes",
        --["Z"] = "expand_all_subnodes",
        -- ["a"] = {
        --   "add",
        --   -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
        --   -- some commands may take optional config options, see `:h neo-tree-mappings` for details
        --   config = {
        --     show_path = "none", -- "none", "relative", "absolute"
        --   },
        -- },
        -- ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
        -- ["d"] = "delete",
        -- ["r"] = "rename",
        -- ["b"] = "rename_basename",
        -- ["y"] = "copy_to_clipboard",
        -- ["x"] = "cut_to_clipboard",
        -- ["p"] = "paste_from_clipboard",
        -- ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
        -- ["c"] = {
        --  "copy",
        --  config = {
        --    show_path = "none" -- "none", "relative", "absolute"
        --  }
        --}
        -- ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
        -- ["q"] = "close_window",
        -- ["R"] = "refresh",
        -- ["<"] = "prev_source",
        -- [">"] = "next_source",
        -- ["i"] = "show_file_details",
        -- ["i"] = {
        --   "show_file_details",
        --   -- format strings of the timestamps shown for date created and last modified (see `:h os.date()`)
        --   -- both options accept a string or a function that takes in the date in seconds and returns a string to display
        --   -- config = {
        --   --   created_format = "%Y-%m-%d %I:%M %p",
        --   --   modified_format = "relative", -- equivalent to the line below
        --   --   modified_format = function(seconds) return require('neo-tree.utils').relative_date(seconds) end
        --   -- }
        -- },
        --

        ["?"] = "show_help",

        ["<CR>"] = "open",
        ["o"] = "open",

        ["<esc>"] = "cancel",
        ["<C-c>"] = "cancel",

        ["<C-s>"] = "open_split",
        ["<C-v>"] = "open_vsplit",

        -- nodes
        ["l"] = "open",
        ["x"] = "close_node",
        ["X"] = "close_all_subnodes",

        -- files
        ["ma"] = "add",
        ["md"] = "delete",
        ["mr"] = "rename",
        ["mc"] = { "copy", config = { show_path = "absolute" } },
        ["mm"] = { "move", config = { show_path = "absolute" } },
        -- https://github.com/nvim-neo-tree/neo-tree.nvim/issues/597
        ["mp"] = function(state)
          local node = state.tree:get_node()
          local content = node.path
          -- relative
          -- local content = node.path:gsub(state.path, ""):sub(2)
          print("Copied to clipboard: " .. content)
          vim.fn.setreg('"', content)
          vim.fn.setreg("1", content)
          vim.fn.setreg("+", content)
        end,

        ["q"] = "close_window",
        ["R"] = "refresh",
      },
    },
    filesystem = {
      window = {
        mappings = {
          -- ["<bs>"] = "navigate_up",
          -- ["."] = "set_root",
          -- ["H"] = "toggle_hidden",
          -- ["/"] = "fuzzy_finder",
          -- ["D"] = "fuzzy_finder_directory",
          -- ["#"] = "fuzzy_sorter", -- fuzzy sorting using the fzy algorithm
          -- ["D"] = "fuzzy_sorter_directory",
          -- ["f"] = "filter_on_submit",
          -- ["<c-x>"] = "clear_filter",
          -- ["[g"] = "prev_git_modified",
          -- ["]g"] = "next_git_modified",
          -- ["o"] = {
          --   "show_help",
          --   nowait = false,
          --   config = { title = "Order by", prefix_key = "o" },
          -- },
          -- ["oc"] = { "order_by_created", nowait = false },
          -- ["od"] = { "order_by_diagnostics", nowait = false },
          -- ["og"] = { "order_by_git_status", nowait = false },
          -- ["om"] = { "order_by_modified", nowait = false },
          -- ["on"] = { "order_by_name", nowait = false },
          -- ["os"] = { "order_by_size", nowait = false },
          -- ["ot"] = { "order_by_type", nowait = false },
          -- ['<key>'] = function(state) ... end,

          ["I"] = "toggle_hidden",
          ["[c"] = "prev_git_modified",
          ["]c"] = "next_git_modified",
        },
      },
    },
  })
end

return Plugin
