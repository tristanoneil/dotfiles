""" use bash
set shell=bash\ --login
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'Yggdroot/indentLine'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'djoshea/vim-autoread'
Plugin 'elzr/vim-json'
Plugin 'fatih/vim-go'
Plugin 'flazz/vim-colorschemes'
Plugin 'gmarik/Vundle.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'isRuslan/vim-es6'
Plugin 'janko-m/vim-test'
Plugin 'junegunn/fzf.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'rust-lang/rust.vim'
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/bats.vim'

call vundle#end()

""" use fzf and map it to ctrl + p
set rtp+=/usr/local/opt/fzf
nnoremap <c-p> :Files<cr>

filetype plugin indent on
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
colorscheme Tomorrow-Night
hi Normal ctermbg=none
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

set dictionary+=~/.vimwords
set complete+=k
