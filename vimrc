""" use bash
set shell=bash\ --login
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-rails'
Plugin 'slim-template/vim-slim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'mxw/vim-jsx'
Plugin 'isRuslan/vim-es6'
Plugin 'pangloss/vim-javascript'
Plugin 'Yggdroot/indentLine'
Plugin 'vim-scripts/bats.vim'
Plugin 'elzr/vim-json'
Plugin 'tpope/vim-surround'
Plugin 'flazz/vim-colorschemes'
Plugin 'fatih/vim-go'
Plugin 'rust-lang/rust.vim'
Plugin 'janko-m/vim-test'
Plugin 'djoshea/vim-autoread'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-commentary'

call vundle#end()

""" use fzf and map it to ctrl + p
set rtp+=/usr/local/opt/fzf
nnoremap <c-p> :Files<cr>

set nocompatible " vim not vi!
syntax enable " enable syntax highlighting
set hidden " opening a new buffer sets the current one to be hidden
set tabstop=2 " set the tab spacing to be 2 chars
set shiftwidth=2 " set the autoindent to be 2 chars
set number " display line numbers
set expandtab " use spaces when pressing tab
set ruler " show line number and column in the status line
set backspace=indent,eol,start " allow backspace
set autoindent " autoindents code
set autoread " auto reload changed files
set clipboard=unnamed " share clipboard with vim
set noshowmode " hide --INSERT--, --REPLACE-- etc.

filetype plugin indent on

set ignorecase " do not care about case when searching with /

""" handling invisible characters
set list " show invisible characters
set listchars="" " reset list chars
set listchars+=tab:\ \
set listchars+=trail:. " display trailing spaces as dots

""" strip trailing whitespace automatically
autocmd BufWritePre * :%s/\s\+$//e

""" store backups in central location
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

""" ignore some files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/vendor/*,*/cache/*

""" colors
colorscheme Tomorrow-Night
set t_Co=256
hi Normal ctermbg=none
hi StatusLine cterm=none ctermbg=none ctermfg=white
hi StatusLineNC cterm=none ctermbg=none
hi VertSplit ctermbg=none
hi Pmenu ctermfg=white ctermbg=none cterm=none
hi PmenuSel ctermfg=11 ctermbg=none cterm=none
set fillchars=stl:—,stlnc:—,vert:│

""" Set syntax highlighting for non-ruby ruby files
autocmd BufNewFile,BufRead Gemfile set filetype=ruby
autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby

""" Autopaste
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

""" Disable quote concealing in JSON
let g:vim_json_syntax_conceal = 0

""" vim-test mappings
nmap <silent> <leader>s :TestNearest<CR>
nmap <silent> <leader>t :TestFile<CR>

set splitbelow
set splitright

hi htmlArg cterm=italic
hi Comment cterm=italic
hi Type cterm=italic

set dictionary+=~/.vimwords
set complete+=k
let g:jsx_ext_required = 0
