""" enable pathogen
execute pathogen#infect()

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
let g:ctrlp_show_hidden = 1 " show hidden files in ctrl p

filetype plugin indent on

set ignorecase " do not care about case when searching with /

""" handling invisible characters
set list " show invisible characters
set listchars="" " reset list chars
set listchars+=tab:\ \
set listchars+=trail:. " display trailing spaces as dots

""" base16 color settings
colorscheme Tomorrow-Night

""" strip trailing whitespace automatically
autocmd BufWritePre * :%s/\s\+$//e

""" store backups in central location
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

""" ignore some files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/vendor/*
