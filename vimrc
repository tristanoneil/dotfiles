""" use bash
set shell=bash\ --login
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-rails'
Plugin 'slim-template/vim-slim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'mxw/vim-jsx'
Plugin 'isRuslan/vim-es6'
Plugin 'Yggdroot/indentLine'
Plugin 'vim-scripts/bats.vim'
Plugin 'elzr/vim-json'
Plugin 'tpope/vim-surround'
Plugin 'flazz/vim-colorschemes'
Plugin 'elixir-lang/vim-elixir'
Plugin 'fatih/vim-go'
Plugin 'rust-lang/rust.vim'
Plugin 'janko-m/vim-test'

call vundle#end()

let g:go_fmt_command = "goimports"

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
hi Pmenu ctermfg=white ctermbg=8 cterm=none
hi PmenuSel ctermfg=none ctermbg=none cterm=none
set fillchars=stl:—,stlnc:—,vert:│

""" Use AG
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

""" Set syntax highlighting for non-ruby ruby files
autocmd BufNewFile,BufRead Gemfile set filetype=ruby
autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby
autocmd BufNewFile,BufRead Berksfile set filetype=ruby

""" Autopaste
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

""" Add some additional autocomplete keywords
set complete+=k~/.vim/keywords.txt

""" Disable quote concealing in JSON
let g:vim_json_syntax_conceal = 0

let g:ctrlp_buffer_func = {
  \ 'enter': 'Function_Name_1',
  \ 'exit': 'Function_Name_2'
\ }

func! Function_Name_1()
    set laststatus=0
endfunc

func! Function_Name_2()
    set laststatus=2
endfunc

""" vim-test mappings
nmap <silent> <leader>s :TestNearest<CR>
nmap <silent> <leader>t :TestFile<CR>
