-- Telescope keymaps are now defined in lazy plugin spec (init.lua)
-- Test keymaps are now defined in lazy plugin spec (init.lua)

vim.api.nvim_set_keymap('i', 'j', 'pumvisible() ? "\\<C-n>" : "\\j"', { noremap = true, expr = true })
vim.api.nvim_set_keymap('i', 'k', 'pumvisible() ? "\\<C-p>" : "\\k"', { noremap = true, expr = true })
vim.api.nvim_set_keymap('i', '<CR>', [[pumvisible() ? "\<C-y>" : "\<CR>"]], { noremap = true, expr = true })
vim.api.nvim_set_keymap('i', 'jj', '<esc>', { noremap = true, silent = true })
