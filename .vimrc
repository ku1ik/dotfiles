" Sickill's VIM configuration

""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""

" Turn off compatibility with Vi
set nocompatible

" Enable plugins
filetype plugin on
filetype indent on

" Load helpfiles
helptags ~/.vim/doc

" Set shell
set shell=/bin/zsh

" Default encoding
set encoding=utf8

""""""""""""""""""""""""""""""""""""""""
" Files & backups
""""""""""""""""""""""""""""""""""""""""

" Backup and history
set history=1000
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Saving and reloading
set confirm
set autoread

""""""""""""""""""""""""""""""""""""""""
" Editing
""""""""""""""""""""""""""""""""""""""""

" Indentation/tab settings
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

" Turn off word wrapping
set nowrap

" Sane backspace behaviour
set backspace=indent,eol,start

" Folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

set matchpairs+=<:>
set iskeyword+=?

set formatoptions-=r "dont continue comments when pushing o/O

""""""""""""""""""""""""""""""""""""""""
" Completion
""""""""""""""""""""""""""""""""""""""""

" Word completion
set completeopt=

" Wildcard completion
set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing"

autocmd FileType css set omnifunc=csscomplete#CompleteCSS

""""""""""""""""""""""""""""""""""""""""
" Search
""""""""""""""""""""""""""""""""""""""""

set incsearch
set hlsearch
set smartcase
set gdefault
set magic

""""""""""""""""""""""""""""""""""""""""
" Status line(s)
""""""""""""""""""""""""""""""""""""""""

set statusline=%f "tail of the filename
set statusline+=\ 
set statusline+=%h      "help file flag
set statusline+=%y      "filetype
set statusline+=%r      "read only flag
set statusline+=%m      "modified flag
set statusline+=%=      "left/right aligned items separated
set statusline+=%#warningmsg#
set statusline+=%*\ 
set statusline+=%-10.(%l,%c%V%)\ %P "ruler

set laststatus=2
set showcmd
set showmode

""""""""""""""""""""""""""""""""""""""""
" UI
""""""""""""""""""""""""""""""""""""""""

" Show line numbering and current line
set number
set cursorline

" Display tabs and trailing spaces
set list
set listchars=tab:»\ ,trail:·,nbsp:·

" Vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

" Hide buffers when not displayed
set hidden

" Show nice title in xterm
set title

" Some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2

set lazyredraw " no redraw when running macros

""""""""""""""""""""""""""""""""""""""""
" Syntax highlighting and colors schemes
""""""""""""""""""""""""""""""""""""""""

" Turn on syntax highlighting
syntax on

" Colors for console
if !has("gui_running")
  set t_Co=256
endif

" Font for gui
if has('gui_running')
  set guifont=Envy\ Code\ R\ 10
  set guioptions-=R
  set guioptions-=l
  set guioptions-=L
  set guioptions-=T
endif

" Scheme
colors Sunburst

" highlight characters in column >130
highlight rightMargin guibg=#440000
match rightMargin /.\%>129v/

""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""

" Leader key
let mapleader=","
let g:mapleader=","

" Switching split windows
nmap <silent> <S-Up> :wincmd k<CR>
nmap <silent> <S-Down> :wincmd j<CR>
nmap <silent> <S-Left> :wincmd h<CR>
nmap <silent> <S-Right> :wincmd l<CR>

" NERD tree
map <F2> <ESC>:NERDTreeToggle<CR>
nmap <leader>ft :NERDTreeFind<cr>

" Command-T
map <C-t> <ESC>:CommandT<CR>

" NERD commenter
"nnoremap <C-_> :call NERDComment(0, "toggle")<CR>
"vnoremap <C-_> <ESC>:call NERDComment(1, "toggle")<CR>
"vmap <C-_> :gv

" EnhComentify
let g:EnhCommentifyUseBlockIndent="Yes"
let EnhCommentifyRespectIndent = "Yes"
" let g:EnhCommentifyPretty="Yes"

" Fast editing of the .vimrc
nmap <leader>e :e! ~/.vimrc<cr>

" When pressing <leader>cd switch to the directory of the open buffer
nmap <leader>cd :cd %:p:h<cr>

" Move line(s) of text using Alt+Shift+Up/Down
"nmap <M-Down> mz:m+<cr>`z
"nmap <M-Up> mz:m-2<cr>`z
vmap <M-Down> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-Up> :m'<-2<cr>`>my`<mzgv`yo`z

" strip trailing whitespace
nmap <leader>sw :%s/\s\+$//g<cr>:nohl<cr>

" preview textile
nmap <leader>pr :TextilePreview<cr>

" turn off search hl
nmap <leader>h :nohl<cr>

" run ruby script
nmap <leader>rr :!ruby %

" keyword completion
imap <F12> <c-p>

" commenting
"imap <S-F12> <ESC><leader>x
"nmap <S-F12> <leader>x
"vmap <S-F12> <leader>x

" remap cursor keys to tab switching
"map <Left> <ESC>:tabprevious<CR>
"map <Right> <ESC>:tabnext<CR>
"map <Up> <ESC>:tabfirst<CR>
"map <Down> <ESC>:tablast<CR>
"imap <Left> <ESC>:tabprevious<CR>
"imap <Right> <ESC>:tabnext<CR>
"imap <Up> <ESC>:tabfirst<CR>
"imap <Down> <ESC>:tablast<CR>

" allow moving with j/k in insert mode
imap <c-j> <Down>
imap <c-k> <Up>
imap <c-h> <Left>
imap <c-l> <Right>

" saving
nmap <C-s> :w<CR>
imap <C-s> <ESC>:w<CR>

" quiting
nmap <C-q> :qa<CR>

""""""""""""""""""""""""""""""""""""""""
" Plugin settings
""""""""""""""""""""""""""""""""""""""""

" NERDTree
let g:NERDChristmasTree = 1
let g:NERDTreeMapOpenSplit = "s"
let g:NERDTreeMapOpenVSplit = "v"

" snipMate
source ~/.vim/snippets/support_functions.vim

" Gist
let g:gist_open_browser_after_post = 1
let g:gist_detect_filetype = 1

" minibufexpl
let g:miniBufExplMaxSize = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplModSelTarget = 1


""""""""""""""""""""""""""""""""""""""""
" Misc
""""""""""""""""""""""""""""""""""""""""

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

" Detect nanoc's Rules file as ruby
au BufReadPost Rules set syntax=ruby

