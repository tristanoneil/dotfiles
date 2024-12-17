vim.g.ale_linters = { ruby = { 'rubocop' } }
vim.g.ale_ruby_rubocop_executable = 'bundle'

require('conform').setup({
  formatters_by_ft = {
    ruby = { 'prettierd', 'prettier', stop_after_first = true },
    javascript = { 'prettierd', 'prettier', stop_after_first = true },
    javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = 'fallback',
  },
})
