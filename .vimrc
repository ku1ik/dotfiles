" ===============================
" Marcin (sickill) Kulik's .vimrc
" http://ku1ik.com/
" ===============================

"""""""""""
" Options "
"""""""""""

set nocompatible                     " turn off compatibility with Vi

set hidden                           " hide buffers when not displayed

set nobackup                         " don't make a backup before overwriting a file.
set nowritebackup                    " ^^^
set directory=~/tmp,/tmp             " keep swap files in one location

set confirm                          " confirm on quit, etc.
set autoread                         " automatically read changes from disk

set showcmd                          " display incomplete commands.
set history=1000                     " remember more commands and search history

set softtabstop=2                    " soft tab width
set tabstop=2                        " global tab width
set shiftwidth=2                     " number of spaces for (un)indenting
set shiftround                       " round indent to multiple of 'shiftwidth'
set expandtab                        " expand tab characters into spaces

set nowrap                           " don't wrap long lines by default

set backspace=indent,eol,start       " intuitive backspacing.

set foldmethod=indent                " folding based on indent
set foldnestmax=3                    " deepest fold is 3 levels
set foldlevel=3
set nofoldenable                     " dont fold by default

set wildmenu                         " enable ctrl-n and ctrl-p to scroll thru matches
set wildmode=list:longest,list:full  " make cmdline tab completion similar to bash

" stuff to ignore when tab completing
set wildignore+=*.o,*.obj,*~,*.png,*.gif,*.jpg,*.jpeg,*.zip,*.jar,*.gem,coverage/**,log/**,.git,tags,*.rbc

" set completeopt=
" set complete=.,w,b,u,t

set incsearch                        " highlight matches as you type.
set hlsearch                         " highlight matches.

set matchpairs+=<:>                  " add < and > to the chars that can be navigated with %
set iskeyword+=?                     " in ruby ? can end keyword

set number                           " show line numbering
set cursorline                       " highlight current line
set colorcolumn=120                  " show right margin

set list                             " show trailing whitespace etc
set listchars=tab:»\ ,trail:·,nbsp:·

set scrolloff=3                      " context in lines around the cursor
set sidescrolloff=3                  " context in columns around the cursor
set sidescroll=1                     " smooth scrolling by 1 column

set title                            " show nice title in xterm
set gtl=%t                           " tab label format

set mouse=a                          " enable mouse in GUI & terminal

set splitbelow splitright            " more intuitive splitting

set lazyredraw                       " don't redraw when running macros and commands that haven't been typed

set pastetoggle=<leader>tp

set laststatus=2                     " show the status line all the time

set statusline=%t                            " Filename
set statusline+=%m                           " Modified flag.
set statusline+=%r                           " Readonly flag.
set statusline+=%w                           " Preview window flag.

set statusline+=\                            " Space.

set statusline+=%#warningmsg#                " Highlight the following as a warning.
set statusline+=%{SyntasticStatuslineFlag()} " Syntastic errors.
set statusline+=%*                           " Reset highlighting.

set statusline+=%=                           " Right align.

set statusline+=(
set statusline+=%{&ff}                       " Format (unix/DOS).
set statusline+=/
set statusline+=%{strlen(&fenc)?&fenc:&enc}  " Encoding (utf-8).
set statusline+=/
set statusline+=%{&ft}                       " Type (python).
set statusline+=)

set statusline+=\ (line\ %l\/%L,\ col\ %03c) " Line and column position and counts.

if &diff
  set nonumber " no line numbers
endif

""""""""""""""""
" Autocommands "
""""""""""""""""

" filetype detection
au BufRead,BufNewFile Gemfile,Rakefile,Thorfile,config.ru,Rules,Vagrantfile,Guardfile,Capfile set ft=ruby
au BufRead,BufNewFile *.json set ft=json
au BufRead,BufNewFile nginx.conf,/etc/nginx/**/* set ft=nginx
au BufRead,BufNewFile *.less set ft=less
au BufNewFile,BufReadPost .tmux.conf*,tmux.conf* set ft=tmux
au BufRead,BufNewFile *.{md,mkd,markdown} set ft=markdown
au BufRead,BufNewFile *.mustache set ft=mustache

" autoindent for yaml files
au BufRead,BufNewFile *.{yml,yaml} setlocal autoindent

" wrapping and spell-checking for markdown files
au BufRead,BufNewFile *.{md,mkd,markdown} setlocal wrap wm=2 textwidth=79 spell

" formatting XML files with autoindent (=)
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" jump to last position when opening a file,
" don't do it when writing a commit log entry
autocmd BufReadPost *
    \ if &filetype !~ 'commit\c' |
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal g`\"" |
    \ endif |
    \ endif

au CursorMoved,CursorMovedI * if &cul | set nocul | endif
au CursorHold,CursorHoldI * set cursorline

au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif

""""""""""""""""""
" Misc functions "
""""""""""""""""""

runtime functions.vim

""""""""""""""""
" Key mappings "
""""""""""""""""

let mapleader = "," " change leader key

" make Y behave like C,D
noremap Y y$

" Preserve selection when indenting
vmap > >gv
vmap < <gv

" move up/down by screen lines, not file lines
nnoremap j gj
nnoremap k gk

" allow moving with h/j/k/l in insert mode
inoremap <c-h> <Left>
inoremap <c-j> <Down>
inoremap <c-k> <Up>
inoremap <c-l> <Right>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Resizing split windows
nmap <silent> <C-Up> <C-w>-
nmap <silent> <C-Down> <C-w>+
nmap <silent> <C-Left> 2<C-w><
nmap <silent> <C-Right> 2<C-w>>

" open tag if only 1 match, show list when multiple matches
" noremap <C-]> g<C-]>

" go to next tag match
map <C-\> :tnext<CR>

" Press Shift+P while in visual mode to replace the selection without
" overwriting the default register
vmap <silent> P p :call setreg('"', getreg('0')) <CR>
" vnoremap <silent> p "_xp"
" vnoremap <silent> P "_xP"

" copy to system clipboard with Ctrl+c
vmap <C-c> "+y

" select last pasted text
" nnoremap <expr> <leader>v '`[' . strpart(getregtype(), 0, 1) . '`]'

" paste intelligently
imap <Leader>v <C-O>:set paste<CR><C-r>*<C-O>:set nopaste<CR>

" sudo write
cmap w!! w !sudo tee % >/dev/null

" toggle wrapping
noremap <silent> <leader>tw :set invwrap<CR>

" Fast editing of the .vimrc
nmap <silent> <leader>. :tabedit $MYVIMRC<CR>

" strip trailing whitespace
nnoremap <silent> <leader><space> mm:%s/\s\+$//e<CR>`m

" auto indent whole file
nnoremap <silent> <leader>= mmgg=G`m

" Opens an (tab)edit command with the path of the currently edited file filled in
" map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
" map <leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Hide search highlighting
nnoremap <silent> <CR> :noh<CR><CR>

" delete and close current file
nmap <leader>x :silent !rm %<cr>:bd<cr>

" close current window
nmap <leader>q <C-w>q

nmap <F5> :call RefreshWithTags()<cr>
nmap <S-F5> :call RefreshGemsTags()<cr>

" don't need no stinkin' arrows
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>
vnoremap <Up> <nop>
vnoremap <Down> <nop>
vnoremap <Left> <nop>
vnoremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

"""""""""""
" Plugins "
"""""""""""

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'ack.vim'
map <leader>a :Ack<Space>

Bundle 'godlygeek/csapprox'
Bundle 'endwise.vim'

Bundle 'Gist.vim'
let g:gist_open_browser_after_post = 1
let g:gist_detect_filetype = 1

Bundle 'edsono/vim-matchit'

Bundle 'tpope/vim-rails'
map <leader>rm :Rmodel<Space>
map <leader>rc :Rcontroller<Space>
map <leader>rv :Rview<Space>
map <leader>rh :Rhelper<Space>
map <leader>ro :Robserver observers/
map <leader>rj :Rjavascript<Space>
map <leader>rs :Rstylesheet<Space>
map <leader>rr :e config/routes.rb<cr>
map <leader>rg :e Gemfile<cr>
command! Rschema :e db/schema.rb

Bundle 'surround.vim'
Bundle 'repeat.vim'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-git'
Bundle 'timcharper/textile.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'ruby.vim'
Bundle 'scratch.vim'

Bundle 'ZoomWin'
map <leader><leader> :ZoomWin<CR>

Bundle 'michaeljsmith/vim-indent-object'

Bundle 'scrooloose/nerdtree'
nmap <silent> <leader>n :NERDTreeToggle<CR>
nmap <silent> <leader>fn :NERDTreeFind<CR>
let NERDTreeMapOpenSplit = "s"
let NERDTreeMapOpenVSplit = "v"
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

Bundle 'tpope/vim-fugitive'
autocmd BufReadPost fugitive://* set bufhidden=delete
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif

Bundle 'msanders/snipmate.vim'
let g:snippets_dir = "~/.vim/snippets"
source ~/.vim/snippets/support_functions.vim

Bundle 'aklt/vim-substitute'
let g:substitute_PromptMap = "<leader>;'"
let g:substitute_NoPromptMap = '<leader>;;'
let g:substitute_GlobalMap = "<leader>';"

Bundle 'tsaleh/vim-align'
let g:loaded_AlignMapsPlugin = "1"

Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'jgdavey/vim-blockle'

Bundle 'ddollar/nerdcommenter'
let NERDCreateDefaultMappings = 0
nmap <leader>c <plug>NERDCommenterToggle
vmap <leader>c <plug>NERDCommenterToggle

Bundle 'tpope/vim-unimpaired'
" bubble current line
nmap <M-j> ]e
nmap <M-k> [e
" bubble visual selection lines
vmap <M-j> ]egv
vmap <M-k> [egv

Bundle 'Rename'
Bundle 'BufOnly.vim'
Bundle 'nginx.vim'
Bundle 'JSON.vim'
Bundle 'searchfold.vim'
Bundle 'greplace.vim'
Bundle 'jQuery'

Bundle 'Syntastic'
let g:syntastic_enable_signs = 1
let g:syntastic_disabled_filetypes = ['eruby']

Bundle 'bingaman/vim-sparkup'
Bundle 'textobj-user'
Bundle 'textobj-rubyblock'

Bundle 'git://git.wincent.com/command-t'
nmap <C-t> :CommandT<CR>
nmap <silent> <Leader>tb :CommandTBuffer<CR>
let g:CommandTMaxHeight = 15

Bundle 'skammer/vim-css-color'
let g:cssColorVimDoNotMessMyUpdatetime = 1

Bundle 'chrisbra/NrrwRgn'

Bundle 'tyru/open-browser.vim'
" nmap map-you-like <Plug>(openbrowser-smart-search)
" vmap map-you-like <Plug>(openbrowser-smart-search)

Bundle 'altercation/vim-colors-solarized'

" Bundle 'tpope/vim-cucumber'
" Bundle 'rosstimson/scala-vim-support'
" Bundle 'nathanaelkane/vim-indent-guides'
" Bundle 'tpope/vim-haml'
" Bundle 'file-line'
" Bundle 'bufkill.vim'
" Bundle 'delimitMate.vim'
" Bundle 'Townk/vim-autoclose'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'QuickBuf'
" Bundle 'ZenCoding.vim'
" Bundle 'LustyJuggler'
" Bundle 'LustyExplorer'
" Bundle 'wookiehangover/jshint.vim'

" Bundle 'robgleeson/hammer.vim'
" map <leader>p :Hammer<CR>

filetype plugin indent on " enable indendation/internal plugins after Vundle

""""""""""""""""""""""""""""""""""""""
" Syntax highlighting / color scheme "
""""""""""""""""""""""""""""""""""""""

syntax enable " Turn on syntax highlighting

if (&term == "linux")
  let g:CSApprox_loaded = 1
else
  " Colors for console
  if !has("gui_running")
    set t_Co=256
  endif

  set background=dark
  " colors solarized
  colors Tomorrow-Night
  " colors Sunburst
endif

" Finally load local config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
