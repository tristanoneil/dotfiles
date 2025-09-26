vim.g.ale_linters = { ruby = { 'rubocop' } }
vim.g.ale_ruby_rubocop_executable = 'bundle'

require('conform').setup({
  formatters_by_ft = {
    ruby = { 'prettierd', 'prettier', stop_after_first = true },
    javascript = { 'prettierd', 'prettier', stop_after_first = true },
    javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
    typescript = { 'prettierd', 'prettier', stop_after_first = true },
    typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
    hcl = { 'terraform_fmt' },
    terraform = { 'terraform_fmt' },
    ["terraform-vars"] = { 'terraform_fmt' },
    sh = { 'shfmt' },
    bash = { 'shfmt' },
  },
  formatters = {
    shfmt = {
      prepend_args = { '-i', '2', '-ci' },
    },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = 'fallback',
  },
})
