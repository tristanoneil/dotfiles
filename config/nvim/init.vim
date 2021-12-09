if empty(glob('~/.nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.nvim/plugged')

Plug 'dense-analysis/ale'
Plug 'djoshea/vim-autoread'
Plug 'lifepillar/vim-solarized8'
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'quramy/tsuquyomi'
Plug 'raimondi/delimitMate'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'yggdroot/indentLine'
Plug 'jsit/disco.vim'
Plug 'projekt0n/github-nvim-theme'
Plug 'editorconfig/editorconfig-vim'
Plug 'jgdavey/tslime.vim'

call plug#end()

""" use fzf and map it to ctrl + p
set rtp+=/opt/homebrew/bin/fzf
nnoremap <c-p> :Files<cr>
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let g:fzf_preview_window = []

set autoindent " autoindents code
set autoread " auto reload changed files
set backspace=indent,eol,start " allow backspace
set clipboard=unnamed " share clipboard with vim
set expandtab " use spaces when pressing tab
set hidden " opening a new buffer sets the current one to be hidden
set ignorecase " do not care about case when searching with /
set nocompatible " vim not vi!
set noshowmode " hide --INSERT--, --REPLACE-- etc.
set number " display line numbers
set ruler " show line number and column in the status line
set shiftwidth=2 " set the autoindent to be 2 chars
set tabstop=2 " set the tab spacing to be 2 chars
set confirm
set splitbelow
set splitright

""" strip trailing whitespace automatically
autocmd BufWritePre * :%s/\s\+$//e

""" colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
set background=light
colorscheme github_light_default

hi! Normal ctermbg=NONE guibg=NONE
hi Pmenu ctermfg=grey ctermbg=none cterm=none
hi PmenuSel ctermfg=11 ctermbg=none cterm=none
hi StatusLine gui=none guibg=none guifg=grey
hi StatusLineNC gui=none guibg=none guifg=lightgrey
hi VertSplit guibg=none
set fillchars=stl:—,stlnc:—,vert:│
set t_Co=256

""" set syntax highlighting for non-ruby ruby files
autocmd BufNewFile,BufRead Gemfile set filetype=ruby

""" autopaste, this copies vims clipboard to the system clipboard and
""" vice-versa
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

""" disable quote concealing in JSON
let g:vim_json_conceal=0

""" vim-test mappings
nmap <silent> <leader>s :TestNearest<CR>
nmap <silent> <leader>t :TestFile<CR>

let g:netrw_localrmdir = 'rm -r' " allow for the deletion of non-empty directories
let g:netrw_banner = 0 " hide the banner in netrw

" ale
let g:ale_fixers = ['rubocop']
let g:ale_linters = {
\   'ruby': ['rubocop'],
\}
let g:ale_fix_on_save = 1
let g:ale_ruby_rubocop_executable = 'bundle'

let test#ruby#rspec#executable = 'bundle exec rspec'
let test#strategy = 'tslime'
