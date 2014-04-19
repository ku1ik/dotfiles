" vim:fdm=marker:fdl=0:nofoldenable

" Marcin (sickill) Kulik's .vimrc
" http://ku1ik.com/

" Options {{{

set nocompatible                     " turn off compatibility with Vi

set hidden                           " hide buffers when not displayed
set nowrap                           " don't wrap long lines by default
set showbreak=↪                      " better line wraps
set autoindent                       " for filetypes that doesn't have indent rules
set number                           " show line numbering
set relativenumber                   " ...but make it relative (except the current line)

set softtabstop=4                    " soft tab width
set tabstop=4                        " global tab width
set shiftwidth=4                     " number of spaces for (un)indenting
set shiftround                       " round indent to multiple of 'shiftwidth'
set expandtab                        " don't expand tab characters into spaces

set hlsearch                         " highlight matches...
set incsearch                        " ...as you type.

set lazyredraw                       " improve screen update speed
set re=1                             " use older regexp engine to speed up ruby syntax

set nobackup                         " don't make a backup before overwriting a file.
set nowritebackup                    " ^^^
set noswapfile                       " don't need no stinky swapfiles
set directory=~/tmp,/tmp             " keep swap files in one location

set confirm                          " confirm on quit, etc.
set autoread                         " automatically read changes from disk

set showcmd                          " display incomplete commands.
set history=1000                     " remember more commands and search history

set backspace=indent,eol,start       " intuitive backspacing.
set virtualedit=block                " allow virtual editing in Visual block mode

set foldmethod=syntax                " folding based on syntax
set foldnestmax=3                    " deepest fold is 3 levels
set foldlevel=3
set nofoldenable                     " don't fold by default

set wildmenu                         " enable ctrl-n and ctrl-p to scroll thru matches
set wildmode=list:longest,list:full  " make cmdline tab completion similar to bash
set wildignorecase                   " tab-complete file names regardless of case

" stuff to ignore when tab completing
set wildignore+=*.o,*.obj,*~,*.png,*.gif,*.jpg,*.jpeg,*.zip,*.jar,*.pyc
set wildignore+=*.gem,*/coverage/*,*/log/*,tags,*.rbc,*.ttf,*.eot
set wildignore+=*/_site/*,*/tmp/*,*/vendor/*,*/public/uploads/*,*/_src/*
set wildignore+=*/.jhw-cache/*,.vagrant,*/.stuff/*,*/test/reports/*,*/*.egg-info/*

set complete=.,w,b,u,t

set matchpairs+=<:>                  " add < and > to the chars that can be navigated with %

set list                             " show trailing whitespace etc
set listchars=tab:»\ ,trail:·,nbsp:·

set scrolloff=3                      " context in lines around the cursor
set sidescrolloff=3                  " context in columns around the cursor
set sidescroll=1                     " smooth scrolling by 1 column

set mouse=a                          " enable mouse in GUI & terminal
set ttymouse=xterm2                  " make sure mouse works under tmux

set colorcolumn=80                   " show right margin
set synmaxcol=512                    " max number of line chars to highlight

set title                            " show nice title in xterm
set gtl=%t                           " tab label format

set vb t_vb=                         " no visual nor audio bell

set splitbelow splitright            " more intuitive splitting

set pastetoggle=<F2>                 " easy toggling of paste mode

set laststatus=2                     " show the status line all the time

set stl=%t                           " Filename
set stl+=%m                          " Modified flag.
set stl+=%r                          " Readonly flag.
set stl+=%w                          " Preview window flag.
set stl+=\                           " Space.
if exists("SyntasticStatuslineFlag")
  set stl+=%#warningmsg#             " Highlight the following as a warning.
  set stl+=%{SyntasticStatuslineFlag()}
  set stl+=%*                        " Reset highlighting.
endif
set stl+=%=                          " Right align.
set stl+=(
set stl+=%{&ff}                      " Format (unix/DOS).
set stl+=/
set stl+=%{strlen(&fenc)?&fenc:&enc} " Encoding (utf-8).
set stl+=/
set stl+=%{&ft}                      " Type (python).
set stl+=)
set stl+=\ (line\ %l\/%L,\ col\ %03c) " Line and column position and counts.

if &diff
  set nonumber                       " no line numbers in vimdiff
endif

set modelines=3                      " check only first 3 lines for modeline

set ttimeoutlen=100                  " time out for terminal key codes

" }}}

" Key mappings {{{

let mapleader = "," " change leader key

" make Y behave like C and D
noremap Y y$

" copy and paste to system clipboard
vnoremap <leader>y "+y
noremap <leader>p "+p

" move up/down by screen lines, not file lines
nnoremap j gj
nnoremap k gk

" easier way to get out of insert mode
inoremap jk <esc>
inoremap jj <esc>

" Preserve selection when indenting
vmap > >gv
vmap < <gv

" Join lines with no spaces between
nnoremap gJ Jdiw

" convert hash rocket to 1.9 hash syntax
nmap <leader>hr mm:s/\v:(\w+) \=\>/\1:/g<CR>`m

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Toggle fold
noremap <space> za

" go to next tag match
map <C-\> :tnext<CR>

" Press Shift+P while in visual mode to replace the selection without
" overwriting the default register
" vmap <silent> P p :call setreg('"', getreg('0')) <CR>
vnoremap <silent> p "_dP
vnoremap <silent> P "_dP

" toggle wrapping
noremap <silent> <leader>w :setl invwrap<Bar>setl wrap?<CR>

" Fast editing of the .vimrc
nmap <silent> <leader>. :tabedit $MYVIMRC<CR>

" strip trailing whitespace
nnoremap <silent> <leader><space> mm:%s/\s\+$//e<CR>`m

" auto indent whole file
nnoremap <silent> <leader>= mmgg=G`m

" Expand %% to buffer's path
cnoremap %% <C-R>=expand('%:h').'/'<CR>

" Inserts the path of the currently edited file into a command
" cmap <C-P> %%

" Replace prompt
nnoremap <leader>s :%s/\v/g<left><left>
vnoremap <leader>s :s/\v/g<left><left>
nnoremap <leader>; :%s/\<<C-r><C-w>\>//g<Left><Left>

" Search for prev/next conflict marker
nnoremap <silent> [= :echo 'Use [n'<CR>
nnoremap <silent> ]= :echo 'Use ]n'<CR>

" Hide search highlighting
nnoremap <silent> <C-c> :noh<CR>

" close and *delete* current file
nmap <leader>x :Unlink<CR>

" kill (close) current window
nnoremap Q <C-w>q

" change inside | | and / /
nnoremap ci\| lF\|lct\|
nnoremap ci/ lF/lct/

" Switch to prev buffer
map <leader><leader> <C-^>

map <F6> :make<CR>

inoremap <Nul> <C-x><C-o>
inoremap <C-Space> <C-x><C-o>

" Bash like keys for the command line
cnoremap <c-a> <Home>
cnoremap <c-e> <End>
cnoremap <c-p> <Up>
cnoremap <c-n> <Down>
cnoremap <c-b> <Left>
cnoremap <c-f> <Right>
cnoremap <c-d> <Del>
cnoremap <c-k> <C-\>estrpart(getcmdline(), 0, getcmdpos()-1)<cr>

" Split with alternate file
noremap <F3> <C-w>o:AV<CR>

" }}}

" Commands {{{

command! Wa wa

" }}}

" Abbreviations {{{

ia mk/ http://ku1ik.com/
ia gh/ https://github.com/
ia ghs/ https://github.com/sickill/

cabbr Q q

" }}}

" Plugins {{{

runtime macros/matchit.vim

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'

" language support plugins

Plugin 'vim-ruby/vim-ruby'

Plugin 'leshill/vim-json'
let g:vim_markdown_folding_disabled = 1

Plugin 'plasticboy/vim-markdown'

Plugin 'timcharper/textile.vim'

Plugin 'nginx.vim'

Plugin 'vim-coffee-script'

Plugin 'tpope/vim-cucumber'

Plugin 'guns/vim-clojure-static'

Plugin 'othree/html5.vim'

Plugin 'puppetlabs/puppet-syntax-vim'

Plugin 'jnwhiteh/vim-golang'

Plugin 'ekalinin/Dockerfile.vim'

Plugin 'Glench/Vim-Jinja2-Syntax'

Plugin 'slim-template/vim-slim'

" file navigation and search plugins

Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '-'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_lazy_update = 150 " ms
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|\.bundle$'
let g:ctrlp_max_depth = 10
let g:ctrlp_switch_buffer = 0
let g:ctrlp_mruf_relative = 1
let g:ctrlp_working_path_mode = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_extensions = ['tag', 'buffertag', 'mixed']
if executable("ag")
  let g:ctrlp_user_command = 'ag %s -i -l --nocolor --hidden -g ""'
endif
nmap <leader>e :CtrlP %%<CR>

Plugin 'scrooloose/nerdtree'
nmap <silent> <leader>n :NERDTreeToggle<CR>
let NERDTreeMapOpenSplit = "s"
let NERDTreeMapOpenVSplit = "v"
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1
let NERDTreeIgnore = ['\~$', '^\.git$', '^\.hg$', '^\.bundle$', '^\.jhw-cache$', '\.pyc$', '\.egg-info$', '__pycache__', '\.vagrant$']

Plugin 'jistr/vim-nerdtree-tabs'
map <silent> <Leader>n <plug>NERDTreeTabsToggle<CR>

Plugin 'mileszs/ack.vim'
map <leader>a :Ack!<Space>
if executable("ag")
  let g:ackprg = 'ag --nogroup --nocolor --column'
else
  let g:ackprg = 'git grep -H --line-number --no-color --untracked'
endif

" color scheme plugins

Plugin 'nanotech/jellybeans.vim'

Plugin 'noahfrederick/vim-hemisu'

Plugin 'altercation/vim-colors-solarized'
let g:solarized_contrast = "high"
let g:solarized_termcolors = 256

" enable indentation/internal plugins after Vundle

filetype plugin indent on

" }}}

" Autocommands {{{

augroup misc
  au!

  autocmd FileType gitcommit setlocal spell

  " jump to last position when opening a file,
  " don't do it when writing a commit log entry
  au BufReadPost *
    \ if &filetype !~ 'commit\c' |
    \   if line("'\"") > 0 && line("'\"") <= line("$") |
    \     exe "normal g`\"" |
    \   endif |
    \ endif

  " cursorline auto show/hide
  au CursorMoved,CursorMovedI * if &cul | set nocursorline | endif
  au CursorHold,CursorHoldI * set cursorline

  au FileType *
    \ if &omnifunc == "" |
    \   setlocal omnifunc=syntaxcomplete#Complete |
    \ endif

  " Disable paste mode when leaving Insert Mode
  au InsertLeave * set nopaste

  " Resize splits when the window is resized
  au VimResized * exe "normal! \<c-w>="

  " Load .vimrc after save
  au BufWritePost .vimrc source ~/.vimrc

  " reset 'number' setting (mkd sets 'nonumber')
  au FileType * setlocal number

  " load available skeleton for new file
  au BufNewFile *.* silent! execute '0r ~/.vim/templates/skeleton.'.expand("<afile>:e") | normal! G

  " tell autoread to reload changed files in terminal vim
  if !has("gui_running")
    au BufEnter,BufWinEnter,CursorHold * silent! checktime
  endif

augroup END

" }}}

" Syntax highlighting & color scheme {{{

syntax enable " Turn on syntax highlighting

if (&term == "linux")
  " colors ???
else
  " Colors for console
  if !has("gui_running")
    set t_Co=256 " Explicitly tell vim that the terminal has 256 colors
  endif

  set background=dark
  colors hemisu
  highlight ColorColumn ctermbg=52
endif

" }}}

source ~/.vim/pasting.vim

" Load local config {{{

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" }}}
