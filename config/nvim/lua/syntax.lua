require('nvim-treesitter.configs').setup {
  ensure_installed = { "ruby", "lua", "vim", "markdown", "javascript", "json", "html", "css", "scss", "yaml", "go", "gomod", "gowork", "gosum" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

-- File type detection for Helm templates
vim.cmd [[
  autocmd BufRead,BufNewFile *.tpl set filetype=helm
  autocmd BufRead,BufNewFile */templates/*.yaml,*/templates/*.yml set filetype=helm
]]
