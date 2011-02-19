" Sickill's VIM configuration

""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""

" Turn off compatibility with Vi
set nocompatible

" Enable plugins
filetype plugin indent on

" Leader key
let mapleader=","

""""""""""""""""""""""""""""""""""""""""
" Files & backups
""""""""""""""""""""""""""""""""""""""""

" Backup and history
set nobackup
set nowritebackup
set noswapfile
set history=1000

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
set nowrap
" set autoindent

" make python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" Sane backspace behaviour
set backspace=indent,eol,start

" Folding settings
set foldmethod=indent   "indent based on syntax
set foldnestmax=3       "deepest fold is 3 levels
set foldlevel=3
set nofoldenable        "dont fold by default

set matchpairs+=<:>
set iskeyword+=?

set pastetoggle=<leader>tp

""""""""""""""""""""""""""""""""""""""""
" Completion
""""""""""""""""""""""""""""""""""""""""

" Word completion
set completeopt=
set complete=.,w,b,u,t

" Wildcard completion
set wildmode=list:longest,list:full   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore+=*.o,*.obj,*~,*.png,*.gif,*.jpg,*.jpeg,*.zip,*.jar,*.gem,coverage/**,log/**,.git "stuff to ignore when tab completing"

""""""""""""""""""""""""""""""""""""""""
" Search
""""""""""""""""""""""""""""""""""""""""

set incsearch
set hlsearch
set gdefault
set tags+=gems-tags

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

" Tab label format
set gtl=%t

" Splitting behavior
set splitbelow splitright

" Status line
set laststatus=2
set statusline=%t%(\ [%M%R%H]%)%(\ [%Y]%)%=%-14.(%l,%c%V%)\ %p%%

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
" hi User1 gui=reverse

" highlight characters in column >120
highlight rightMargin guibg=#440000
match rightMargin /.\%>120v/

""""""""""""""""""""""""""""""""""""""""
" Plugin settings
""""""""""""""""""""""""""""""""""""""""

" NERDTree
let g:NERDTreeMapOpenSplit = "s"
let g:NERDTreeMapOpenVSplit = "v"
" let g:NERDTreeQuitOnOpen = 1

" snipMate
let g:snippets_dir = "~/.vim/snippets"
source ~/.vim/snippets/support_functions.vim

" Gist
let g:gist_open_browser_after_post = 1
let g:gist_detect_filetype = 1

" substitute
let g:substitute_PromptMap = "<Leader>;'"
let g:substitute_NoPromptMap = '<Leader>;;'
let g:substitute_GlobalMap = "<Leader>';"

" turn off AlignMaps
let g:loaded_AlignMapsPlugin = "v41"

" NERDCommenter
let NERDCreateDefaultMappings = 0

""""""""""""""""""""""""""""""""""""""""
" Misc
""""""""""""""""""""""""""""""""""""""""

" Additional filetype detection
au BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,config.ru,Rules} set ft=ruby
au BufRead,BufNewFile {*.json} set ft=json

" Additional commands ala rails.vim
command! Rroutes :e config/routes.rb
command! Rschema :e db/schema.rb
command! Rgemfile :e Gemfile

""""""""""""""""""""""""""""""""""""""""
" Functions
""""""""""""""""""""""""""""""""""""""""

" jump to last cursor position when opening a file
" dont do it when writing a commit log entry
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

" function! SuperCleverTab()
"   let col = col('.') - 1
"   if !col || getline('.')[col - 1] =~ '^\\s$'
"     return "\\<Tab>"
"   else
"     return "\\<C-P>"
"   endif
" endfunction

" function! CompleteTagOrInsertSlash()
"   if &syntax != "eruby"
"     return "\\/"
"   endif
"   let col = col('.') - 1
"   if !col || getline('.')[col - 1] !~ '^<$'
"     return "\\/"
"   else
"     return "\\/\\<C-P>" " need sth better than keyword compl here
"   endif
" endfunction

" autoclose tags
" imap <silent> / <C-R>=CompleteTagOrInsertSlash()<CR>

function ToggleWrap()
  if &wrap
    set nowrap
  else
    set wrap
  endif
endfunction

function! RefreshNERDTree()
  if exists("t:NERDTreeBufName")
    let nr = bufwinnr(t:NERDTreeBufName)
    if nr != -1
      exe nr . "wincmd w"
      exe substitute(mapcheck("R"), "<CR>", "", "")
      wincmd p
    endif
  endif
endfunction

function! RefreshCommandT()
  if exists(":CommandTFlush") == 2
    CommandTFlush
  endif
endfunction

function! Refresh()
  call RefreshNERDTree()
  call RefreshCommandT()
endfunction

function! RefreshTags()
  call system("ctags -f ./tags -R --sort=yes --fields=+l " . getcwd() . "/*")
endfunction

function! RefreshGemsTags()
  let gems_path = system("echo '`bundle show rails`/../*'")
  call system("ctags -f ./gems-tags -R --sort=yes --fields=+l " . gems_path)
endfunction

function! RefreshWithTags()
  call Refresh()
  call RefreshTags()
endfunction


""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""

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

" Move line(s) of text down/up using Alt+j/k
nnoremap <silent> <A-j> :m+<CR>==
nnoremap <silent> <A-k> :m-2<CR>==
inoremap <silent> <A-j> <Esc>:m+<CR>==gi
inoremap <silent> <A-k> <Esc>:m-2<CR>==gi
vnoremap <silent> <A-j> :m'>+<CR>gv=gv
vnoremap <silent> <A-k> :m-2<CR>gv=gv

" Indenting with Alt + [,],h,l
nmap <A-[> <<
nmap <A-]> >>
vmap <A-[> <gv
vmap <A-]> >gv
nmap <A-h> <<
nmap <A-l> >>

" Switching split windows
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

" Resizing split windows
nmap <silent> <C-Up> <C-w>-
nmap <silent> <C-Down> <C-w>+
nmap <silent> <C-Left> 2<C-w><
nmap <silent> <C-Right> 2<C-w>>

" Press Shift+P while in visual mode to replace the selection without
" overwriting the default register
vmap <silent> P p :call setreg('"', getreg('0')) <CR>

" Sudo write
cmap w!! w !sudo tee % >/dev/null

" toggle wrapping
noremap <silent> <Leader>tw :call ToggleWrap()<CR>

" Quick write session with F2
map <F2> :mksession! ~/vim_session <cr>
" And load session with F3
map <F3> :source ~/vim_session <cr>

" commenting
nmap <Leader>c <plug>NERDCommenterToggle
vmap <Leader>c <plug>NERDCommenterToggle

" run blockle with AutoClose turned off
autocmd FileType ruby map <silent> <buffer> <Leader>bl :AutoCloseOff<CR><Plug>BlockToggle:AutoCloseOn<CR>

" ,, to zoomwin
map <Leader><Leader> :ZoomWin<CR>

" ,ac for Ack
map <Leader>ac :Ack<Space>

" NERD tree
nmap <silent> <Leader>n :NERDTreeToggle<CR>
nmap <silent> <leader>fn :NERDTreeFind<CR>

" Command-T
" map <silent> <C-t> <ESC>:CommandT<CR>

" ,bo for BufOnly
nmap <Leader>bo :BufOnly<CR>

" Fast editing of the .vimrc
nmap <silent> <leader>ve :tabedit $MYVIMRC<CR>

" strip trailing whitespace
nnoremap <silent> <leader>sw :call Preserve("%s/\\s\\+$//e")<CR>

" auto indent whole file
nnoremap <silent> <leader>= :call Preserve("normal gg=G")<CR>

" preview markdown
nmap <leader>pm :!rdiscount % \|browser<CR>

" run ruby script
nmap <leader>rr :!ruby %<CR>

" Opens an (tab)edit command with the path of the currently edited file filled in
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
" map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Hide search highlighting
nnoremap <silent> <CR> :noh<CR><CR>

" delete current file
nmap <leader>x :silent !rm %<cr>

nmap <F5> :call RefreshWithTags()<cr>
nmap <S-F5> :call RefreshGemsTags()<cr>

" shortcuts for rails.vim commands
map <leader>rm :Rmodel<Space>
map <leader>rc :Rcontroller<Space>
map <leader>rv :Rview<Space>
map <leader>rh :Rhelper<Space>
map <leader>ro :Robserver observers/
map <leader>rj :Rjavascript<Space>
map <leader>rs :Rstylesheet<Space>
map <leader>rr :Rroutes<CR>
map <leader>rg :Rgemfile<CR>

nmap <leader>a= :Tabularize /=<CR>
vmap <leader>a= :Tabularize /=<CR>
nmap <leader>a: :Tabularize /:\zs<CR>
vmap <leader>a: :Tabularize /:\zs<CR>


" Load local config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

set rtp+=~/.vim/vundle.git/
call vundle#rc()

Bundle 'https://github.com/mileszs/ack.vim.git'
Bundle 'https://github.com/godlygeek/csapprox.git'
Bundle 'https://github.com/tpope/vim-endwise.git'
Bundle 'https://github.com/mattn/gist-vim.git'
Bundle 'https://github.com/edsono/vim-matchit.git'
Bundle 'https://github.com/tpope/vim-rails.git'
Bundle 'https://github.com/tpope/vim-surround.git'
Bundle 'https://github.com/tpope/vim-repeat.git'
Bundle 'https://github.com/tpope/vim-markdown.git'
Bundle 'https://github.com/tpope/vim-cucumber.git'
Bundle 'https://github.com/tpope/vim-git.git'
Bundle 'https://github.com/timcharper/textile.vim.git'
Bundle 'https://github.com/pangloss/vim-javascript.git'
Bundle 'https://github.com/vim-ruby/vim-ruby.git'
Bundle 'https://github.com/duff/vim-scratch.git'
Bundle 'https://github.com/rphillips/vim-zoomwin.git'
Bundle 'https://github.com/rosstimson/scala-vim-support.git'
Bundle 'https://github.com/michaeljsmith/vim-indent-object.git'
Bundle 'https://github.com/sickill/nerdtree.git'
Bundle 'https://github.com/nathanaelkane/vim-indent-guides.git'
Bundle 'https://github.com/tpope/vim-fugitive.git'
Bundle 'https://github.com/msanders/snipmate.vim.git'
Bundle 'https://github.com/tpope/vim-haml.git'
Bundle 'https://github.com/robgleeson/vim-markdown-preview.git'
Bundle 'https://github.com/aklt/vim-substitute.git'
Bundle 'https://github.com/godlygeek/tabular.git'
Bundle 'https://github.com/ecomba/vim-ruby-refactoring.git'
Bundle 'https://github.com/ddollar/nerdcommenter.git'
Bundle 'https://github.com/tpope/vim-unimpaired.git'
Bundle 'https://github.com/jgdavey/vim-blockle.git'
Bundle 'https://github.com/Townk/vim-autoclose.git'
Bundle 'Rename'
Bundle 'file-line'
Bundle 'BufOnly.vim'
Bundle 'nginx.vim'
Bundle 'bufkill.vim'
Bundle 'JSON.vim'
" Bundle 'https://github.com/wincent/Command-T.git'
" Bundle 'easytags.vim'
" git@github.com:sickill/snipmate-snippets.git
