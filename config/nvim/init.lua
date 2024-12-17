-- Check if vim-plug is installed, and install it if not
local plug_path = vim.fn.stdpath('config') .. '/autoload/plug.vim'
if vim.fn.empty(vim.fn.glob(plug_path)) > 0 then
  vim.fn.system({
    'curl', '-fLo', plug_path, '--create-dirs',
    'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  })
  vim.cmd [[autocmd VimEnter * PlugInstall --sync | source $MYVIMRC]]
end

-- Plugins setup
vim.cmd [[
call plug#begin('~/.nvim/plugged')

Plug 'dense-analysis/ale'
Plug 'janko-m/vim-test'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'preservim/vimux'
Plug 'github/copilot.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'rose-pine/neovim'
Plug 'xiyaowong/transparent.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'stevearc/dressing.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'yetone/avante.nvim', { 'branch': 'main', 'do': 'make' }
Plug 'HakonHarnes/img-clip.nvim'
Plug 'goolord/alpha-nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'slim-template/vim-slim'
Plug 'stevearc/conform.nvim'

call plug#end()
]]

require('theme')
require('status')
require('startup')
require('ai')
require('space')
require('keymaps')
require('format')
require('tests')
require('syntax')

-- Editor settings
vim.opt.showcmd = false
vim.opt.autoread = true
vim.opt.clipboard = 'unnamed'
vim.opt.expandtab = true
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.confirm = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.conceallevel = 0
vim.opt.number = true
vim.opt.autoread = true
vim.opt.fillchars:append({ eob = " " })
vim.g.netrw_banner = 0
vim.opt.pumblend = 0
vim.opt.winblend = 0
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})

-- Strip trailing whitespace on save
vim.cmd [[autocmd BufWritePre * %s/\s\+$//e]]

-- Alternate file creation
vim.cmd [[
  command AC :execute "e " . eval('rails#buffer().alternate()')
]]

vim.cmd [[
  let &t_SI .= "\<Esc>[?2004h"
  let &t_EI .= "\<Esc>[?2004l"
]]
