" ====================================================== "
" AUTHOR: Francisco Castillo
" SOURCE: https://github.com/fjcasti1/.myconfig/dotfiles
" ====================================================== "

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
Plugin 'fjcasti1/lichen'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'jreybert/vimagit'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" ====================================================== "
" End Vundle
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

" Time in ms that is waited for a key code or mapped key seq to complete "
set timeoutlen=500

" Easier moving of code blocks, aka it won't lose its selection "
vnoremap < <gv
vnoremap > >gv

" Show whitespace "
" MUST be inserted BEFORE the colorscheme command "
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Colorscheme "
set t_Co=256
silent! color lichen

" Syntax Highlight "
filetype on
filetype plugin indent on
syntax on

"" Showing line numbers ,length and format options"
set number " Number lines "
set textwidth=79  " width of document (used by gd) "
set nowrap " don't automatically wrap on load "
set fo-=t  " don't automatically wrap text when typing "
set colorcolumn=79
set formatoptions=c,q,r,t
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
set smartindent " Indents instead of tabs

" Make search case insensitive "
set hlsearch
set ignorecase
set incsearch
set smartcase

" Allows for more robust behavior of <%> matching.
" " NOTE -- runtime vs. source -- runtime is relative to vim directory;
"   while source needs an absolute path.
runtime macros/matchit.vim

" Shows list for <tab> complete in : (command) mode
set wildmenu
set wildmode=list:longest " Shows all of the options in wild menu.

" Shows info on current command in status line "
set showcmd

" Minimal number of screen lines to keep above and below the cursor "
set scrolloff=10

" A buffer becomes hidden when it is abandoned "
set hidden

" Sets central temp file location, to prevent local default behavior.
if isdirectory($HOME . '/.vim/.tmp') == 0
  :silent !mkdir -m 700  -p ~/.vim/.tmp > /dev/null 2>&1
endif

set backupdir=~/.vim/.tmp ",~/.local/tmp/vim,/var/tmp,/tmp,
set directory=~/.vim/.tmp ",~/.local/tmp/vim,/var/tmp,/tmp,

if exists("+viminfo")
  " viminfo -- Saves Vim state information such as marks, command line
  "            history, search string history, buffers, global vars, 
  "            registers, search/sub patterns, and input-line history.
  "            :help viminfo
  "            Allegedly default permissions are sufficient for privacy.
  "
  if isdirectory( $HOME . '/.vim/.state') == 0
    :silent !mkdir -m 700 -p ~/.vim/.state > /dev/null 2>&1
  endif
  set viminfo+=n~/.vim/.state/viminfo
  set spellfile =$HOME/.vim/.state/spell/en.utf-8.add
  set spellfile+=$HOME/.vim/.state/spell/en.latin1.add
  set spellfile+=$HOME/.vim/.state/spell/en.ascii.add
  set spelllang=en_us
endif

if exists("+undofile")
  " undofile -- This allows you to use undos after exiting and 
  "             restarting. NOTE: only present in 7.3+
  "             :help undo-persistence
  if isdirectory( $HOME . '/.vim/.undo' ) == 0
    :silent !mkdir -m 700 -p ~/.vim/.undo > /dev/null 2>&1
  endif
  set undodir=~/.vim/.undo
  set undofile
endif

" For code folding: saves code folding for next session
"   Also saves the view, and thus the place of the cursor.
"   ISSUE : doesn't necessarily update with the .vimrc, requires
"           cleaning.
if isdirectory( $HOME . '/.vim/.state/view') == 0
  :silent !mkdir -m 700 -p ~/.vim/.state/view > /dev/null 2>&1
endif
set viewdir=~/.vim/.state/view
autocmd BufWrite * mkview
autocmd BufRead  * silent loadview

"" Group Closing-MultiLine
inoremap (<cr>  ()<Left><CR><CR><C-D><Up><tab>
inoremap {<cr>  {}<Left><CR><CR><C-D><Up><tab>
inoremap [<cr>  []<Left><CR><CR><C-D><Up><tab>
inoremap (      ()<Left>
inoremap {      {}<Left>
inoremap [      []<Left>
inoremap ()     ()<Left>
inoremap {}     {}<Left>
inoremap []     []<Left>
" Group Closing-One Line (plus back up for {})
inoremap (<space> (  )<Left><Left>
inoremap {<space> {  }<Left><Left>
inoremap [<space> [  ]<Left><Left>

" When a bracket is inserted, briefly jump to the matching one "
set showmatch
set matchtime=5

" Adds custom general highlighting to comment keywords
function! HighlightKeywords()
  let v=&ft."Comment"
  exe 'syn keyword myTodo containedin='. v '
     \ TODO XXX BUG NOTE FIXME ADD ISSUE QUEST QUESTION ASK FIX 
     \ GARBAGE TRASH BAD OKAY CITE REF DISCUSS DISC TALK MORE 
     \ LESS CLEAN MARK HERE CHECK CITE EQUATION'
  hi def link myTodo Todo
endfunction
autocmd Syntax * call HighlightKeywords()

" ===================================================================== "
" Python IDE Setup "
" ===================================================================== "
"
" Settings for vim-powerline "
set laststatus=2

" Settings for ctrlP "
map <Leader>o <C-p>
let g:ctrlp_max_height = 20
let g:ctrlp_working_path_mode = 'aw'
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

" GIT "
map <Leader>m :Magit<CR>
let g:magit_default_fold_level=0
let g:magit_auto_close=1
autocmd User VimagitEnterCommit startinsert
autocmd User VimagitEnterCommit setlocal textwidth=72
autocmd User VimagitLeaveCommit setlocal textwidth=0

"""LATEX

autocmd FileType tex let localmapleader =','
" Word count:
autocmd FileType tex map <leader>w :w !detex \| wc -w<CR>
" Code snippets
autocmd FileType tex inoremap <localleader>fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
autocmd FileType tex inoremap <localleader>fi \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap <localleader>exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap <localleader>em \emph{}<++><Esc>T{i
autocmd FileType tex inoremap <localleader>bf \textbf{}<++><Esc>T{i
autocmd FileType tex vnoremap <localleader> <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a
autocmd FileType tex inoremap <localleader>it \textit{}<++><Esc>T{i
autocmd FileType tex inoremap <localleader>ct \textcite{}<++><Esc>T{i
autocmd FileType tex inoremap <localleader>cp \parencite{}<++><Esc>T{i
autocmd FileType tex inoremap <localleader>glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
autocmd FileType tex inoremap <localleader>x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
autocmd FileType tex inoremap <localleader>ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap <localleader>ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap <localleader>li <Enter>\item<Space>
autocmd FileType tex inoremap <localleader>ref \ref{}<Space><++><Esc>T{i
autocmd FileType tex inoremap <localleader>tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
autocmd FileType tex inoremap <localleader>ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
autocmd FileType tex inoremap <localleader>can \cand{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap <localleader>con \const{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap <localleader>v \vio{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap <localleader>a \href{}{<++>}<Space><++><Esc>2T{i
autocmd FileType tex inoremap <localleader>sc \textsc{}<Space><++><Esc>T{i
autocmd FileType tex inoremap <localleader>chap \chapter{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap <localleader>sec \section{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap <localleader>ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap <localleader>sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap <localleader>st <Esc>F{i*<Esc>f}i
autocmd FileType tex inoremap <localleader>beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
autocmd FileType tex inoremap <localleader>up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex nnoremap <localleader>up /usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex inoremap <localleader>tt \texttt{}<Space><++><Esc>T{i
autocmd FileType tex inoremap <localleader>bt {\blindtext}
autocmd FileType tex inoremap <localleader>nu $\varnothing$
autocmd FileType tex inoremap <localleader>col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
autocmd FileType tex inoremap <localleader>rn (\ref{})<++><Esc>F}i
"
"let g:livepreview_previewer = 'your_viewer'
