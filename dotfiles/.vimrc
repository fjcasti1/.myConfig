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
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'python-mode/python-mode'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdtree'
Plugin 'tmhedberg/SimpylFold'
Plugin 'fjcasti1/lichen'
Plugin 'lervag/vimtex'
"Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'mattn/emmet-vim'
Plugin 'mbbill/undotree'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" ====================================================== "
" End Vundle
" ====================================================== "
"
"Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" Optimize for fast terminal connections
set ttyfast

" Don’t add empty newlines at the end of files
set binary
set noeol

" Avoid <Esc> key "
inoremap qq <Esc>

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

" Tabs in different buffers vertically split"
map <Leader>t :new<CR>:vert ba<CR>
map <Leader>n :bnext<CR>
map <Leader>b :bprev<CR>

" Horizontal splits "
map <Leader>h :split<CR>
map <Leader><Up> <c-w><Up><CR>
map <Leader><Down> <c-w><Down><CR>

" Vertical splits "
map <Leader>v :vsplit<CR>
map <Leader><Left> <c-w><Left><CR>
map <Leader><Right> <c-w><Right><CR>

" Undo Tree "
nnoremap <Leader>u :UndotreeShow<CR>
" Quit Buffers "
noremap <Leader>d :bd<CR>
" Quick Save & Quit "
noremap <Leader>w :w<CR>
noremap <Leader>q :q<CR>
inoremap ww <Esc>:w<CR>i

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

" Showing line numbers ,length and format options"
set number " Number lines "
set textwidth=79  " width of document (used by gd) "
set nowrap " don't automatically wrap on load "
set fo-=t  " don't automatically wrap text when typing "
set colorcolumn=79
set formatoptions=c,q,r,t
highlight ColorColumn ctermbg=233
" Highlight current line
set cursorline

" Easier formatting of paragraphs "
vmap Q gq
nmap Q gqap

" Useful settings "
set history=1000
set undolevels=700

" Real programmers don't use TABs but spaces "
autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab
set smartindent " Indents instead of tabs

" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Override ignorecase if the search patter contains upper case characters
set smartcase

" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Show the current mode
set showmode
" Show the (partial) command as it’s being typed
set showcmd

" Allows for more robust behavior of <%> matching.
" " NOTE -- runtime vs. source -- runtime is relative to vim directory;
"   while source needs an absolute path.
runtime macros/matchit.vim

" Shows list for <tab> complete in : (command) mode
set wildmenu
set wildmode=list:longest " Shows all of the options in wild menu.

" Minimal number of screen lines to keep above and below the cursor "
set scrolloff=10

" A buffer becomes hidden when it is abandoned "
set hidden

" Centralize backups, swapfiles and undo history

" Sets central temp file location, to prevent local default behavior.
if isdirectory($HOME . '/.vim/.tmp') == 0
  :silent !mkdir -m 700  -p ~/.vim/.tmp > /dev/null 2>&1
endif

if isdirectory( $HOME . '/.vim/backups') == 0
  :silent !mkdir -m 700 -p ~/.vim/backups > /dev/null 2>&1
endif
if isdirectory( $HOME . '/.vim/swaps') == 0
  :silent !mkdir -m 700 -p ~/.vim/swaps > /dev/null 2>&1
endif
set backupdir=~/.vim/backups
set directory=~/.vim/swaps

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
map <Leader>f <C-p>
let g:ctrlp_max_height = 20
let g:ctrlp_working_path_mode = 'aw'
let g:ctrlp_show_hidden = 1
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
"map <Leader>a :NERDTree<CR>
"map <Leader>' :NERDTreeClose<CR>
map <Leader>o :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=3
let NERDTreeNaturalSort=1
let NERDTreeShowHidden=1
"let NERDTreeCustomOpenArgs={'file':{'where':'t'}, 'dir':{'where':'t'}}

" Searching faster
map s :%s/

" GIT - FUGITIVE"
map <Leader>g :G<CR>
map <Leader>gc :Gcommit<CR>
map <Leader>gps :Gpush<CR>
map <Leader>gpl :Gpull<CR>
map <Leader>gf :diffget //2<CR>
map <Leader>gh :diffget //3<CR>

""LATEX

autocmd BufNewFile *.tex 0r ~/.vim/templates/skeleton.tex
autocmd FileType tex let maplocalleader = '\<tab>'
" Word count:
"autocmd FileType tex map <leader>w :w !detex \| wc -w<CR>
" Code snippets
autocmd FileType tex inoremap upa<tab> <++><Esc>/usepackage<CR>}geo\usepackage{}<Esc>i
" Text writing
autocmd FileType tex inoremap <Space><Space> <Esc>/<++><CR>c4l
autocmd FileType tex noremap <Space><Space> <Esc>/<++><CR>c4l
autocmd FileType tex inoremap <tab><tab> <Esc>/<++><CR>c4l
autocmd FileType tex noremap <tab><tab> <Esc>/<++><CR>c4l
autocmd FileType tex inoremap sec<tab> \section{}<CR><CR><++><Esc><Up><Up>$i
autocmd FileType tex inoremap ssec<tab> \subsection{}<CR><CR><++><Esc><Up><Up>$i
autocmd FileType tex inoremap sssec<tab> \subsubsection{}<CR><CR><++><Esc><Up><Up>$i
autocmd FileType tex inoremap enm<tab> \begin{enumerate}<CR><CR>\end{enumerate}<CR><CR><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap itz<tab> \begin{itemize}<CR><CR>\end{itemize}<CR><CR><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap itm<tab> <ESC>$o\item<Space>

autocmd FileType tex inoremap txt<tab> \text{} <++><Esc>T{i
autocmd FileType tex inoremap tbf<tab> \textbf{} <++><Esc>T{i
autocmd FileType tex inoremap tit<tab> \textit{} <++><Esc>T{i
" math writing
autocmd FileType tex inoremap <localleader>beq \begin{equation}<CR><++><CR>\end{equation}<CR><CR><++><Esc>kkk^cw
autocmd FileType tex inoremap eq<tab> \begin{equation}<CR><++><CR>\end{equation}<CR><CR><++><Esc>kkk^cw
autocmd FileType tex inoremap al<tab> \begin{align}<CR><++><CR>\end{align}<CR><CR><++><Esc>kkk^cw
autocmd FileType tex inoremap frac<tab> \frac{}{<++>} <++><Esc>bbli
autocmd FileType tex inoremap pa<tab> \partial
autocmd FileType tex inoremap Alp<tab> \Alpha
autocmd FileType tex inoremap Del<tab> \Delta
autocmd FileType tex inoremap Lam<tab> \Lambda
autocmd FileType tex inoremap Ome<tab> \Omega
autocmd FileType tex inoremap The<tab> \Theta
autocmd FileType tex inoremap alp<tab> \alpha
autocmd FileType tex inoremap del<tab> \delta
autocmd FileType tex inoremap lam<tab> \lambda
autocmd FileType tex inoremap mu<tab> \mu
autocmd FileType tex inoremap nu<tab> \nu
autocmd FileType tex inoremap ome<tab> \omega
autocmd FileType tex inoremap the<tab> \theta
autocmd FileType tex inoremap nab<tab> \nabla
autocmd FileType tex inoremap bld<tab> \bold{}<++><Esc>4hi
autocmd FileType tex inoremap $ $$<Space><++><Esc>5hi
" Operations
autocmd FileType tex inoremap sum<tab> \sum_{<++>}^{<++>}<++><Esc>15hc4l
autocmd FileType tex inoremap bar<tab> \bar{<++>}<++><Esc>8hc4l
autocmd FileType tex inoremap hat<tab> \hat{<++>}<++><Esc>8hc4l

autocmd FileType tex noremap <F1> :w<CR>:VimtexCompile<CR>
autocmd FileType tex inoremap <F1> <Esc>:w<CR>:VimtexCompile<CR>i<Right>
autocmd FileType tex inoremap <C-w> <Esc>:w<CR>

"autocmd FileType tex inoremap <localleader>fr \begin{frame}<CR>\frametitle{}<CR><CR><++><CR><CR>\end{frame}<CR><CR><++><Esc>6kf}i
"autocmd FileType tex inoremap <localleader>fi \begin{fitch}<CR><CR>\end{fitch}<CR><CR><++><Esc>3kA
"autocmd FileType tex inoremap <localleader>exe \begin{exe}<CR>\ex<Space><CR>\end{exe}<CR><CR><++><Esc>3kA
"autocmd FileType tex inoremap <localleader>em \emph{}<++><Esc>T{i
"autocmd FileType tex vnoremap <localleader> <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<CR>a
"autocmd FileType tex inoremap <localleader>ct \textcite{}<++><Esc>T{i
"autocmd FileType tex inoremap <localleader>cp \parencite{}<++><Esc>T{i
"autocmd FileType tex inoremap <localleader>glos {\gll<Space><++><Space>\\<CR><++><Space>\\<CR>\trans{``<++>''}}<Esc>2k2bcw
"autocmd FileType tex inoremap <localleader>x \begin{xlist}<CR>\ex<Space><CR>\end{xlist}<Esc>kA<Space>
"autocmd FileType tex inoremap <localleader>ref \ref{}<Space><++><Esc>T{i
"autocmd FileType tex inoremap <localleader>tab \begin{tabular}<CR><++><CR>\end{tabular}<CR><CR><++><Esc>4kA{}<Esc>i
"autocmd FileType tex inoremap <localleader>ot \begin{tableau}<CR>\inp{<++>}<Tab>\const{<++>}<Tab><++><CR><++><CR>\end{tableau}<CR><CR><++><Esc>5kA{}<Esc>i
"autocmd FileType tex inoremap <localleader>can \cand{}<Tab><++><Esc>T{i
"autocmd FileType tex inoremap <localleader>con \const{}<Tab><++><Esc>T{i
"autocmd FileType tex inoremap <localleader>v \vio{}<Tab><++><Esc>T{i
"autocmd FileType tex inoremap <localleader>a \href{}{<++>}<Space><++><Esc>2T{i
"autocmd FileType tex inoremap <localleader>sc \textsc{}<Space><++><Esc>T{i
"autocmd FileType tex inoremap <localleader>chap \chapter{}<CR><CR><++><Esc>2kf}i
"autocmd FileType tex inoremap <localleader>sec \section{}<CR><CR><++><Esc>2kf}i
"autocmd FileType tex inoremap <localleader>ssec \subsection{}<CR><CR><++><Esc>2kf}i
"autocmd FileType tex inoremap <localleader>sssec \subsubsection{}<CR><CR><++><Esc>2kf}i
"autocmd FileType tex inoremap <localleader>st <Esc>F{i*<Esc>f}i
"autocmd FileType tex inoremap <localleader>up <Esc>/usepackage<CR>o\usepackage{}<Esc>i
"autocmd FileType tex nnoremap <localleader>up /usepackage<CR>o\usepackage{}<Esc>i
"autocmd FileType tex inoremap <localleader>tt \texttt{}<Space><++><Esc>T{i
"autocmd FileType tex inoremap <localleader>bt {\blindtext}
"autocmd FileType tex inoremap <localleader>nu $\varnothing$
"autocmd FileType tex inoremap <localleader>col \begin{columns}[T]<CR>\begin{column}{.5\textwidth}<CR><CR>\end{column}<CR>\begin{column}{.5\textwidth}<CR><++><CR>\end{column}<CR>\end{columns}<Esc>5kA
"autocmd FileType tex inoremap <localleader>rn (\ref{})<++><Esc>F}i
"
"let g:livepreview_previewer = 'your_viewer'

let g:vimtex_fold_enabled = 1
autocmd BufEnter *.tex set foldmethod=expr
autocmd BufEnter *.tex set foldexpr=vimtex#fold#level(v:lnum)
autocmd BufEnter *.tex set foldtext=vimtex#fold#text()
let g:vimtex_quickfix_latexlog = {
    \ 'default' : 1,
    \ 'ignore_filters' : [],
    \ 'general' : 1,
    \ 'references' : 1,
    \ 'overfull' : 0,
    \ 'underfull' : 0,
    \ 'font' : 1,
    \ 'packages' : {
        \   'default' : 1,
        \   'general' : 1,
        \   'babel' : 1,
        \   'biblatex' : 1,
        \   'fixltx2e' : 1,
        \   'hyperref' : 1,
        \   'natbib' : 1,
        \   'scrreprt' : 1,
        \   'titlesec' : 1,
        \ },
    \}
"let g:vimtex_quickfix_latexlog = {
"        \ 'overfull' : 0,
"        \ 'underfull' : 0,
"        \}

" HTML "
autocmd BufNewFile *.html 0r ~/.vim/templates/skeleton.html
let g:user_emmet_leader_key='<Tab>'


let g:airline#extensions#tabline#enabled = 1