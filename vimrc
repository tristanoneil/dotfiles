""" use bash set shell=bash\ --login

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'djoshea/vim-autoread'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf.vim'
Plug 'quramy/tsuquyomi'
Plug 'raimondi/delimitMate'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'yggdroot/indentLine'

call plug#end()

""" use fzf and map it to ctrl + p
set rtp+=/usr/local/opt/fzf
nnoremap <c-p> :Files<cr>
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

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
syntax enable " enable syntax highlighting

""" handling invisible characters
set list " show invisible characters
set listchars+=tab:\ \
set listchars+=trail:. " display trailing spaces as dots
set listchars="" " reset list chars

""" strip trailing whitespace automatically
autocmd BufWritePre * :%s/\s\+$//e

""" store backups in central location
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

""" ignore some files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/vendor/*,*/cache/*

""" colors
silent! colorscheme palenight
set termguicolors
let g:palenight_terminal_italics=1
hi! Normal ctermbg=NONE guibg=NONE
hi Pmenu ctermfg=white ctermbg=none cterm=none
hi PmenuSel ctermfg=11 ctermbg=none cterm=none
hi StatusLine cterm=none ctermbg=none ctermfg=white
hi StatusLineNC cterm=none ctermbg=none
hi VertSplit ctermbg=none
set fillchars=stl:—,stlnc:—,vert:│
set t_Co=256

""" set syntax highlighting for non-ruby ruby files
autocmd BufNewFile,BufRead Gemfile set filetype=ruby
autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby

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
let g:vim_json_syntax_conceal = 0

""" vim-test mappings
nmap <silent> <leader>s :TestNearest<CR>
nmap <silent> <leader>t :TestFile<CR>

set splitbelow
set splitright

" Make html args, comments and keywords italic
hi htmlArg cterm=italic
hi Comment cterm=italic
hi Type cterm=italic

set dictionary+=~/.vim/keywords.txt
set complete+=k

let g:netrw_localrmdir = 'rm -r' " allow for the deletion of non-empty directories
let g:netrw_banner = 0 " hide the banner in netrw
