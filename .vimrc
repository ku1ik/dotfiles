" Sickill's VIM configuration

""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""

" load all the bundles
filetype off
call pathogen#runtime_append_all_bundles()

" Turn off compatibility with Vi
set nocompatible

" Enable plugins
filetype plugin on
filetype indent on

""""""""""""""""""""""""""""""""""""""""
" Files & backups
""""""""""""""""""""""""""""""""""""""""

" Backup and history
set nobackup
set nowritebackup
set directory=~/tmp,/tmp
set history=1000

" Saving and reloading
set confirm
set autoread
au FocusLost * :wa " save all buffers when (g)vim looses focus

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
set foldmethod=indent   "indent based on syntax
set foldnestmax=3       "deepest fold is 3 levels
set foldlevel=3
set nofoldenable        "dont fold by default

set matchpairs+=<:>
set iskeyword+=?

set formatoptions-=r "dont continue comments when inserting new line (with Enter)
set formatoptions-=o "dont continue comments when inserting new line (with o or O)

""""""""""""""""""""""""""""""""""""""""
" Completion
""""""""""""""""""""""""""""""""""""""""

" Word completion
set completeopt=
set complete=.,w,b,u,t

" Wildcard completion
set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~,*.png,*.gif,*.jpg,*.jpeg,*.zip,*.jar,*.gem,coverage/**,log/** "stuff to ignore when tab completing"

autocmd FileType css set omnifunc=csscomplete#CompleteCSS

""""""""""""""""""""""""""""""""""""""""
" Search
""""""""""""""""""""""""""""""""""""""""

set incsearch
set hlsearch
set gdefault

""""""""""""""""""""""""""""""""""""""""
" UI
""""""""""""""""""""""""""""""""""""""""

" Show line numbering and current line
set number
set numberwidth=5
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

" Tab label format
set gtl=%t

" Splitting behavior
set splitbelow splitright

" Status line
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

set shortmess+=I        " disable the welcome screen

""""""""""""""""""""""""""""""""""""""""
" Syntax highlighting and colors schemes
""""""""""""""""""""""""""""""""""""""""

" Turn on syntax highlighting
syntax on

if (&term == "linux")
  let g:CSApprox_loaded = 1
else
  " Colors for console
  if !has("gui_running")
    set t_Co=256
  endif

  " Scheme
  colors Sunburst
endif

" for modified flag
hi User1 gui=reverse

" highlight characters in column >120
highlight rightMargin guibg=#440000
match rightMargin /.\%>120v/

""""""""""""""""""""""""""""""""""""""""
" Plugin settings
""""""""""""""""""""""""""""""""""""""""

" NERDTree
let g:NERDChristmasTree = 1
let g:NERDTreeMapOpenSplit = "s"
let g:NERDTreeMapOpenVSplit = "v"

" snipMate
" source ~/.vim/snippets/support_functions.vim

" Gist
let g:gist_open_browser_after_post = 1
let g:gist_detect_filetype = 1

" zen coding
let g:user_zen_leader_key = '<c-e>'
let g:user_zen_settings = { 'indentation' : '  ' }

""""""""""""""""""""""""""""""""""""""""
" Misc
""""""""""""""""""""""""""""""""""""""""

" These file are ruby!
au BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,config.ru,Rules} set ft=ruby

" Additional commands ala rails.vim
command! Rroutes :e config/routes.rb
command! Rschema :e db/schema.rb

""""""""""""""""""""""""""""""""""""""""
" Functions
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

function! SuperCleverTab()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] =~ '^\s$'
    return "\<Tab>"
  else
    return "\<C-P>"
  endif
endfunction

function! CompleteTagOrInsertSlash()
  if &syntax != "eruby"
    return "\/"
  endif
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '^<$'
    return "\/"
  else
    return "\/\<C-P>" " need sth better than keyword compl here
  endif
endfunction

""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""

" Leader key
let mapleader=","

" Switching split windows
nmap <silent> <S-Up> :wincmd k<CR>
nmap <silent> <S-Down> :wincmd j<CR>
nmap <silent> <S-Left> :wincmd h<CR>
nmap <silent> <S-Right> :wincmd l<CR>

" NERD tree
map <silent> <F2> <ESC>:NERDTreeToggle<CR>
nmap <silent> <leader>ft :NERDTreeFind<CR>

" Command-T
map <silent> <C-t> <ESC>:CommandT<CR>

" Fast editing of the .vimrc
nmap <silent> <leader>v :tabedit $MYVIMRC<CR>

" Move line(s) of text using Alt+j/k
nnoremap <silent> <A-j> :m+<CR>==
nnoremap <silent> <A-k> :m-2<CR>==
inoremap <silent> <A-j> <Esc>:m+<CR>==gi
inoremap <silent> <A-k> <Esc>:m-2<CR>==gi
vnoremap <silent> <A-j> :m'>+<CR>gv=gv
vnoremap <silent> <A-k> :m-2<CR>gv=gv

" Preserve selection when indenting
vmap > >gv
vmap < <gv

" Indenting with Alt + [ and ]
nmap <A-[> <<
nmap <A-]> >>
nmap <A-h> <<
nmap <A-l> >>
vmap <A-[> <gv
vmap <A-]> >gv

" strip trailing whitespace
nnoremap <silent> <leader>sw :call Preserve("%s/\\s\\+$//e")<CR>

" auto indent whole file
nnoremap <silent> <leader>= :call Preserve("normal gg=G")<CR>

" preview textile
nmap <leader>pr :TextilePreview<CR>

" preview markdown
nmap <leader>pm :!rdiscount % \|browser<CR>

" run ruby script
nmap <leader>rr :!ruby %<CR>

" allow moving with j/k in insert mode
inoremap <c-j> <Down>
inoremap <c-k> <Up>
inoremap <c-h> <Left>
inoremap <c-l> <Right>

" prev/next buffer
nmap <silent> <A-Right> :bn<CR>
nmap <silent> <A-Left> :bp<CR>

" commenting
nmap <leader>c gcc
vmap <leader>c gc

" complete with Tab
inoremap <silent> <Tab> <C-R>=SuperCleverTab()<CR>

" make Y behave like C,D
noremap Y y$

" toggle (no)paste
nnoremap <silent> <leader>tp :set invpaste paste?<CR>

" autoclose tags
" imap <silent> / <C-R>=CompleteTagOrInsertSlash()<CR>

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Hide search highlighting
nnoremap <silent> <CR> :noh<CR><CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Press Shift+P while in visual mode to replace the selection without
" overwriting the default register
vmap <silent> P p :call setreg('"', getreg('0')) <CR>

" shortcuts for rails.vim commands
map <Leader>rm :Rmodel 
map <Leader>rc :Rcontroller 
map <Leader>rv :Rview 
map <Leader>ro :Robserver observers/
map <Leader>rj :Rjavascript 
map <Leader>rsm :RSmodel 
map <Leader>rsc :RScontroller 
map <Leader>rsv :RSview 
map <Leader>rtm :RTmodel 
map <Leader>rtc :RTcontroller 
map <Leader>rtv :RTview 

" ,z to zoomwin
map <Leader>z :ZoomWin<CR>

" ,a for Ack
map <Leader>a :Ack<space>

" cd into root dir of file's project
map <silent> <unique> <Leader>,cd <Plug>RooterChangeToRootDirectory

" move up/down by screen lines, not file lines
nnoremap j gj
nnoremap k gk

" Sudo write (,W)
noremap <leader>W :w !sudo tee %<CR>

nmap <unique> <Leader>_a <Plug>ToggleAutoCloseMappings

" Load local config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
