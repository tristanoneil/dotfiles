require('nvim-web-devicons').setup({
  default = true,
})

require('avante_lib').load()
require('avante').setup({
  provider = "copilot",
  auto_suggestions_provider = "copilot",
  behaviour = {
    auto_suggestions = false,
  }
})

vim.g.copilot_filetypes = { markdown = true, gitcommit = true }
vim.g.copilot_workspace_folders = { "~/src/maji" }
