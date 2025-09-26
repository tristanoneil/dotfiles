local actions = require("telescope.actions")

require('telescope').setup({
  pickers = {
    find_files = {
      disable_devicons = true,
      hidden = true
    },
    buffers = {
      disable_devicons = true
    },
    live_grep = {
      disable_devicons = true
    }
  },
  defaults = {
    file_ignore_patterns = {
      "spec/cassettes",
      "vendor",
      "public",
      "^%.git/",
      "^%.git$",
      "%.DS_Store$",
      "^node_modules/"
    },
    mappings = {
      i = {
        ["<esc>"] = actions.close,
      },
    },
  }
})
