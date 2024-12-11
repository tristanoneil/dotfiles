require('telescope').setup({
  pickers = {
    find_files = {
      disable_devicons = true
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
      "public"
    },
  }
})
