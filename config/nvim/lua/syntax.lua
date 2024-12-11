require('nvim-treesitter.configs').setup {
  ensure_installed = { "ruby", "lua", "vim", "markdown", "javascript", "json", "html", "css", "scss", "yaml" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
