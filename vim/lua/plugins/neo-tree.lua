local Plugin = {}

Plugin.setup = function()
  require("neo-tree").setup({
    window = {
      mappings = {
        ["o"] = "open",
      },
    },
    filesystem = {
      window = {
        mappings = {
          ["I"] = "toggle_hidden",
          ["f"] = "fuzzy_finder",
          ["[c"] = "prev_git_modified",
          ["]c"] = "next_git_modified",
        },
      },
    },
    buffers = {
      window = {
        mappings = {
          ["o"] = "noop",
        },
      },
    },
    git_status = {
      window = {
        mappings = {
          ["o"] = "noop",
        },
      },
    },
  })
end

return Plugin
