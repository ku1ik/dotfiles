" Sickill's VIM configuration

""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""

" load all the bundles
call pathogen#runtime_append_all_bundles()

" Turn off compatibility with Vi
set nocompatible

" Enable plugins
filetype plugin on
filetype indent on

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
set tabstop=2
set expandtab
set autoindent

" Turn off word wrapping
set nowrap

" Sane backspace behaviour
set backspace=indent,eol,start

" Folding settings
set foldmethod=syntax   "fold based on syntax
set foldnestmax=3       "deepest fold is 3 levels
set foldlevel=3
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
"set statusline+=%h      "help file flag
set statusline+=%y      "filetype
set statusline+=%r      "read only flag
set statusline+=%1*%m%*      "modified flag
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

" Tab labels and tooltips format
set gtl=%t
set gtt=%F

" Splitting behavior
set splitbelow splitright

""""""""""""""""""""""""""""""""""""""""
" Syntax highlighting and colors schemes
""""""""""""""""""""""""""""""""""""""""

" Turn on syntax highlighting
syntax on

" Colors for console
if !has("gui_running")
  set t_Co=256
endif

" Scheme
colors sunburst

"for modified flag
hi User1 gui=reverse

" highlight characters in column >130
highlight rightMargin guibg=#440000
match rightMargin /.\%>130v/

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

" Reload .vimrc
map <silent> ,v :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>:NERDTreeClose<CR>

" When pressing <leader>cd switch to the directory of the open buffer
nmap <leader>cd :cd %:p:h<cr>

" Move line(s) of text using Alt+j/k
nnoremap <A-j> :m+<CR>==
nnoremap <A-k> :m-2<CR>==
inoremap <A-j> <Esc>:m+<CR>==gi
inoremap <A-k> <Esc>:m-2<CR>==gi
vnoremap <A-j> :m'>+<CR>gv=gv
vnoremap <A-k> :m-2<CR>gv=gv

" Indenting with Alt + [ and ]
nmap <A-[> <<
nmap <A-]> >>
vmap <A-[> <gv
vmap <A-]> >gv

" strip trailing whitespace
nnoremap <leader>sw :call Preserve("%s/\\s\\+$//e")<CR>

" auto indent whole file
nnoremap <leader>= :call Preserve("normal gg=G")<CR>

" preview textile
nmap <leader>pr :TextilePreview<cr>

" turn off search hl
nmap <c-h> :nohl<cr>

" run ruby script
nmap <leader>rr :!ruby %

" keyword completion
imap <F12> <c-p>

" allow moving with j/k in insert mode
imap <c-j> <Down>
imap <c-k> <Up>
imap <c-h> <Left>
imap <c-l> <Right>

" prev/next buffer
nmap <A-Right> :bn<cr>
nmap <A-Left> :bp<cr>

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

" NERDCommenter
let NERDSpaceDelims = 1
let NERDDefaultNesting = 0

" snipMate
source ~/.vim/snippets/support_functions.vim

" Gist
let g:gist_open_browser_after_post = 1
let g:gist_detect_filetype = 1

" zen coding
let g:user_zen_leader_key = '<c-e>'
let g:user_zen_settings = { 'indentation' : '  ' }

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

function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
