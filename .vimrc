set nocompatible
set backspace=indent,eol,start
set history=1000
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set ruler
set showcmd
set showmode
set incsearch
set hlsearch
set number
set noswapfile
set cursorline
set nowrap
set completeopt=
set ignorecase
set smartcase
set title
set confirm
set gdefault
let mapleader=","

if !has("gui_running")
  set t_Co=256
endif

if has('gui_running')
  set guifont=Envy\ Code\ R\ 10
  set guioptions-=r
  set guioptions-=R
  set guioptions-=l
  set guioptions-=L
  set guioptions-=T
  set guioptions-=m
endif

"set background=dark
colors ir_black

au BufReadPost Rules set syntax=ruby

helptags ~/.vim/doc

set statusline=%f "tail of the filename
set statusline+=\ 
set statusline+=%h      "help file flag
set statusline+=%y      "filetype
set statusline+=%r      "read only flag
set statusline+=%m      "modified flag

set statusline+=%=      "left/right aligned items separated

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*\ 
set statusline+=%-10.(%l,%c%V%)\ %P "ruler

set laststatus=2

"indent settings
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
filetype plugin indent on

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

"wildcard completion
set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing"

set formatoptions-=o "dont continue comments when pushing o/O

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

"display tabs and trailing spaces
set list
set listchars=tab:»\ ,trail:·,nbsp:·

"turn on syntax highlighting
syntax on

"some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2

"hide buffers when not displayed
set hidden

"switching split windows
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

"jump to last cursor position when opening a file
"dont do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
    if &filetype !~ 'commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal! g`\""
            normal! zz
        endif
    end
endfunction

"NERD tree
map <F2> <ESC>:NERDTreeToggle<CR>

"NERD commenter
nnoremap <C-_> :call NERDComment(0, "toggle")<CR>
vnoremap <C-_> <ESC>:call NERDComment(1, "toggle")<CR>
vmap <C-_> :gv

"Fuzzy Finder
map <C-t> <ESC>:FuzzyFinderTextMate<CR>
let g:fuzzy_ignore = "tmp/*;log/*;.git/*"
map <F5> <ESC>:FuzzyFinderTextMateRefreshFiles<CR>
"let g:fuzzy_path_display = "full"

"Sparkup
"let g:sparkup="~/bin/sparkup"

"syntastic
let g:syntastic_enable_signs=1

"gist
let g:gist_open_browser_after_post = 1
let g:gist_detect_filetype = 1
