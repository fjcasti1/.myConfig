" ====================================================== "
" Use Vundle
" ====================================================== "
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" My Plugins "
Plugin 'powerline/powerline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'python-mode/python-mode'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdtree'
Plugin 'tmhedberg/SimpylFold'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" ====================================================== "
" Use Vundle
" ====================================================== "

" Performance Options "
set autoindent " New lines inherit the indentation of previous lines.
set lazyredraw " Don’t update screen during macro and script execution.

" User Interface Options "
set title " Sets title of terminal to /path/file - vim

" Automatic reloading of .vimrc "
autocmd! bufwritepost .vimrc source %

" Better Copy & Paste "
set pastetoggle=<F2>
set clipboard=unnamed

" Rebind <Leader> Key "
let mapleader = " "

"Backspace behaves normally"
set backspace=indent,eol,start

" Tabs "
map <Leader>t :tabnew<CR>
map <Leader>n :tabnext<CR>
map <Leader>b :tabprevious<CR>

" Horizontal splits "
map <Leader>h :split<CR>
map <Leader><Up> <c-w><Up><CR>
map <Leader><Down> <c-w><Down><CR>

" Vertical splits "
map <Leader>v :vsplit<CR>
map <Leader><Left> <c-w><Left><CR>
map <Leader><Right> <c-w><Right><CR>

" Save & Quit Quick "
noremap <Leader>q :q<CR>
noremap <Leader>w :w<CR>

" Map sort function to a key, removes duplicates "
vnoremap <Leader>s :sort u<CR>
vnoremap <Leader>S :sort! u<CR>

" Easier moving of code blocks, aka it won't lose its selection "
vnoremap < <gv
vnoremap > >gv

" Show whitespace "
" MUST be inserted BEFORE the colorscheme command "
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Colorscheme "
set t_Co=256
color lichen

" Syntax Highlight "
filetype on
filetype plugin indent on
syntax on

"" Showing line numbers and length "
set number " Number lines "
set tw=79  " width of document (used by gd) "
set nowrap " don't automatically wrap on load "
set fo-=t  " don't automatically wrap text when typing "
set colorcolumn=79
""" Don't write your code longer than 80 characters, first line warning "
""if exists('+colorcolumn')
""  execute"set colorcolumn=72," . join(range(80,300),",")
""endif
highlight ColorColumn ctermbg=233

" Easier formatting of paragraphs "
vmap Q gq
nmap Q gqap

" Useful settings "
set history=1000
set undolevels=700

" Real programmers don't use TABs but spaces "
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make search case insensitive "
set hlsearch
set ignorecase
set incsearch
set smartcase

" Shows info on current command in status line "
set showcmd

" Allows for more robust behavior of <%> matching.
" " NOTE -- runtime vs. source -- runtime is relative to vim directory;
"   while source needs an absolute path.
runtime macros/matchit.vim

" Shows list for <tab> complete in : (command) mode
set wildmenu
set wildmode=list:longest " Shows all of the options in wild menu.


" ===================================================================== "
" Python IDE Setup "
" ===================================================================== "
"
" Settings for vim-powerline "
set laststatus=2

" Settings for ctrlP "
map <Leader>o <C-p>
let g:ctrlp_max_height = 20
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Setting for python-mode "
"map <Leader>g :call RopeGotoDefinition()<CR>
"let ropevim_enable_shortcuts=1
"let g:pymode_rope_goto_def_newwin="vnew"
"let g:pymode_rope_extended_complete=1
"let g:pymode_breakpoint=0
"let g:pymode_syntax=1
"let g:pymode_syntax_builtin_objs=0
"let g:pymode_syntax_builtin_funcs=0
map <Leader>k :call CheckPoint(line("."))<CR>
function! CheckPoint(line)
    normal! oipdb.set_trace()  # CHECKPOINT
    normal ==
    normal 1Goimport ipdb
    normal }ge
    normal V1G S
    execute "normal! ". a:line. "G"
    normal j
endfunction

" Python Folding
set nofoldenable
nnoremap fo zo
nnoremap fO zR
nnoremap ff zc
nnoremap fF zM
"highlight Folded guibg=grey guifg=blue
"highlight FoldColumn guibg=darkgrey guifg=white
set smartindent           " Indents instead of tabs

"" SuperTab "
autocmd FileType python3 setlocal omnifunc=python3complete#Complete
let g:SuperTabDefaultCompletionType="context"
set completeopt=menuone,longest,preview


let g:jedi#auto_initialization = 1
let g:jedi#smart_auto_mappings = 1
let g:jedi#max_doc_height=50
let g:jedi#usages_command=""
let g:jedi#popup_select_first = 1

" NERDTree "
map <Leader>a :NERDTree<CR>
map <Leader>' :NERDTreeClose<CR>
let NERDTreeQuitOnOpen=3
let NERDTreeNaturalSort=1
let NERDTreeCustomOpenArgs={'file':{'where':'t'}, 'dir':{'where':'t'}}

" Searching faster
map s :%s/
