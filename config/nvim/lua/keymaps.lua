vim.keymap.set('n', '<leader>ag', function()
  require('telescope.builtin').grep_string({
    search = vim.fn.input("Grep > ")
  })
end, { noremap = true, silent = true })

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-p>', builtin.find_files, { noremap = true, silent = true })
vim.keymap.set('n', '<C-b>', builtin.buffers, { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>s', ':TestNearest<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>t', ':TestFile<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('i', 'j', 'pumvisible() ? "\\<C-n>" : "\\j"', { noremap = true, expr = true })
vim.api.nvim_set_keymap('i', 'k', 'pumvisible() ? "\\<C-p>" : "\\k"', { noremap = true, expr = true })
vim.api.nvim_set_keymap('i', '<CR>', [[pumvisible() ? "\<C-y>" : "\<CR>"]], { noremap = true, expr = true })
