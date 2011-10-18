set nocompatible
filetype off

set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundles {{{1
Bundle 'gmarik/vundle'

Bundle 'wincent/Command-T'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-flatfoot'
Bundle 'ervandew/supertab'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'vim-scripts/camelcasemotion'
Bundle 'godlygeek/tabular'
Bundle 'sjl/threesome.vim.git'

Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-git.git'
Bundle 'Twinside/vim-haskellConceal.git'
Bundle 'othree/html5.vim.git'

Bundle 'altercation/vim-colors-solarized.git'
Bundle 'vim-scripts/Zenburn.git'
" }}}1

" Options {{{1
filetype plugin indent on

set novisualbell t_vb=
set title
set t_Co=256
set lazyredraw         " Do not redraw buffer then executing macros etc.
set mousehide

set termencoding=utf-8
set fileencodings=utf-8,windows-1251,iso-8859-15,koi8-r
set encoding=utf8

set hidden
set virtualedit=all
set backspace=indent,eol,start
set nojoinspaces
set formatoptions-=o          " Do not continue comments when pressing o/O
set shellslash
set autowrite

set scrolljump=1
set scrolloff=7
set sidescrolloff=10
set sidescroll=10

set incsearch
set hlsearch
set wrapscan
set ignorecase
set smartcase
set noinfercase
set gdefault

set autoindent
set smartindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

set nowrap
set textwidth=79
set showmatch
set list
set listchars=tab:¬¬,extends:»,precedes:«
if exists('&colorcolumn')
    set colorcolumn=80
endif

set foldmethod=indent
set foldlevel=20

set wildmenu
set wildcharm=<TAB>
set wildmode=list:longest
set wildignore=*.o,*~,*.pyc,*.pyo,.git,.svn,.hg,.env

set nobackup
set directory=$HOME/.vim/tmp
set viminfo='128,/32,:32,<64,@32,s10,h,n$HOME/.vim/viminfo
set sessionoptions=blank,buffers,curdir,slash,tabpages,unix

set diffopt+=iwhite

set splitright
set splitbelow

set fillchars=""  " Get rid of the silly characters in window separators
set showcmd       " Show partial command (or visual selection size) in cmd line
set cmdheight=2
set laststatus=2
set statusline=%1*%m%*%2*%r%*%f%=\ Col:%3*%03v%*\ Ln:%3*%03l%*/%3*%03L%*\ File:%{&filetype}/%{&fileformat}/%{&fileencoding}\ Char:%04b/0x%03B%*%<

set numberwidth=3
set nonumber
if exists('&relativenumber')
    set norelativenumber
endif

if has('gui_running') " {{{2
    set mouse=a
    set mousemodel=popup

    set guioptions-=T  " No toolbar
    set guioptions-=l  " No scrollbars
    set guioptions-=r
    set guioptions-=L
    set guioptions-=R
    set guioptions-=m  " No menu

    set guicursor=n-v-c:block-Cursor-blinkon0
    set guicursor+=ve:ver35-Cursor
    set guicursor+=o:hor50-Cursor
    set guicursor+=i-ci:ver25-Cursor
    set guicursor+=r-cr:hor20-Cursor
    set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon17

    set guifont=DejaVu\ Sans\ Mono\ 10
endif " }}}2

syntax on
set synmaxcol=512
" }}}1

" Mappings {{{1
let mapleader = ","
let maplocalleader = "\\"
set pastetoggle=<F12>

inoremap jj <ESC>
inoremap jk <ESC>
inoremap kj <ESC>

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
nnoremap <A-H> <C-w>H
nnoremap <A-J> <C-w>J
nnoremap <A-K> <C-w>K
nnoremap <A-L> <C-w>L
nnoremap <A-c> <C-w>c
nnoremap <A-v> <C-w>v
nnoremap <A-s> <C-w>s
nnoremap <A-w> <C-w>w
nnoremap <A-o> <C-w>o

nnoremap Y y$

" Center screen on search match
nnoremap n nzz
nnoremap N Nzz

" Select just pasted text
nnoremap <leader>v V`]

" Allow command line editing like emacs
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-B> <Left>
cnoremap <C-F> <Right>
cnoremap <C-N> <Down>
cnoremap <C-P> <Up>

" Write as sudo
cnoremap w!! w !sudo tee % >/dev/null

" Toggle wrap
nnoremap <leader>iw :set invwrap<CR>:set wrap?<CR>
" Toggle line numbers
nnoremap <leader>in :set invnumber<CR>:set number?<CR>
" Toggle spell checking
nnoremap <leader>is :set invspell<CR>:set spell?<CR>

" Disable search highlight
nnoremap <leader>dh :silent nohlsearch<CR>
" Highlight all instances of the current word under the cursor
nnoremap <silent> <leader>hh :setl hls<CR>:let @/="\\<<C-r><C-w>\\>"<CR>

:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>rv :source $MYVIMRC<cr>


" Command-T
nnoremap <leader>t :CommandT<CR>
" NERDTree
nnoremap <leader>it :NERDTreeToggle<CR>
" Surround
nnoremap ys<space> ysl<space><space>
" Fugitive
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
nnoremap <silent> <leader>gg :Ggrep <C-r><C-w><CR>
" Tabular
nnoremap <leader>a= :Tabularize /=<CR>
vnoremap <leader>a= :Tabularize /=<CR>
nnoremap <leader>a: :Tabularize /:\zs<CR>
vnoremap <leader>a: :Tabularize /:\zs<CR>

" }}}1

" Plugins {{{1
runtime macros/matchit.vim

" Fugitive
if has("autocmd")
    augroup fugutiveAU
        autocmd!
        autocmd BufReadPost fugitive://* set bufhidden=delete
        autocmd User fugitive
          \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
          \     nnoremap <buffer> .. :edit %:h<CR> |
          \ endif
    augroup END
endif
" }}}1

" Autocommands {{{1
if has("autocmd")
    augroup FTOptions " {{{2
        autocmd!
        autocmd FileType vim setlocal foldmethod=marker
        autocmd FileType sh setlocal foldmethod=marker
        autocmd FileType gitcommit setlocal spell
        autocmd FileType html,htmldjango setlocal sw=2 sts=2 ts=2 et
        autocmd FileType mail setlocal wrap
        autocmd FileType python setlocal nosmartindent
    augroup END "}}}2
end
" }}}1

" Commands {{{1
command! -bar Invert :let &background = (&background == "light" ? "dark" : "light")

function! OpenURL(url)
    if has("win32")
        exe "!start cmd /cstart /b ".a:url.""
    elseif $DISPLAY !~ '^\w'
        exe "silent !firefox \"".a:url."\""
    else
        exe "silent !firefox -T \"".a:url."\""
    endif
    redraw!
endfunction
command! -nargs=1 OpenURL :call OpenURL(<q-args>)
nnoremap gG :OpenURL https://encrypted.google.com/search?q=<cword><CR>
" }}}


if filereadable($HOME."/.vim/bundle/local/vimrc")
    set runtimepath+=$HOME/.vim/bundle/local/
    source $HOME/.vim/bundle/local/vimrc
endif