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
set noswapfile                       " don't need no stinky swapfiles
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
set autoindent                       " for filetypes that doesn't have indent rules

set nowrap                           " don't wrap long lines by default

set backspace=indent,eol,start       " intuitive backspacing.
set virtualedit=block                " allow virtual editing in Visual block mode

set foldmethod=syntax                " folding based on syntax
set foldnestmax=3                    " deepest fold is 3 levels
set foldlevel=3
set nofoldenable                     " dont fold by default

set wildmenu                         " enable ctrl-n and ctrl-p to scroll thru matches
set wildmode=list:longest,list:full  " make cmdline tab completion similar to bash

" stuff to ignore when tab completing
set wildignore+=*.o,*.obj,*~,*.png,*.gif,*.jpg,*.jpeg,*.zip,*.jar
set wildignore+=*.gem,*/coverage/*,*/log/*,tags,*.rbc,*.ttf,*.eot
set wildignore+=*/_site/*,*/tmp/*,*/vendor/*,*/public/uploads/*,*/_src/*
set wildignore+=*/.jhw-cache/*
" set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

set complete=.,w,b,u

set hlsearch                         " highlight matches...
set incsearch                        " ...as you type.
set ignorecase                       " case insensitive search
set smartcase                        " ...only when pattern is all lowercase

set matchpairs+=<:>                  " add < and > to the chars that can be navigated with %

set number                           " show line numbering
" set cursorline                       " highlight current line

set list                             " show trailing whitespace etc
set listchars=tab:»\ ,trail:·,nbsp:·

set scrolloff=3                      " context in lines around the cursor
set sidescrolloff=3                  " context in columns around the cursor
set sidescroll=1                     " smooth scrolling by 1 column

set mouse=a                          " enable mouse in GUI & terminal

set colorcolumn=80                   " show right margin

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

if &term =~ "xterm\\|rxvt"
  let &t_SI = "\<Esc>]12;orange\x7"
  let &t_EI = "\<Esc>]12;gray\x7"
  " autocmd VimLeave * silent !echo -ne "\033]112\007"
endif

""""""""""""""""
" Key mappings "
""""""""""""""""

let mapleader = "," " change leader key

" i'm lazy
" noremap <space> :
" nnoremap ; :
" nnoremap : ;

" make Y behave like C, D
noremap Y y$

" learn to use _ instead of ^
nmap ^ <NOP>

" easier redo
noremap U <C-r>

" move up/down by screen lines, not file lines
nnoremap j gj
nnoremap k gk

" easier way to get out of insert mode
inoremap jk <esc>
inoremap jj <esc>
" inoremap <esc> <nop>

" Preserve selection when indenting
vmap > >gv
vmap < <gv

" allow moving with Ctrl + h/j/k/l in insert mode
" inoremap <c-h> <Left>
" inoremap <c-j> <Down>
" inoremap <c-k> <Up>
" inoremap <c-l> <Right>

" hash rocket!
imap <c-l> <space>=><space>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Resizing split windows
nmap <silent> <S-Up> <C-w>-
nmap <silent> <S-Down> <C-w>+
nmap <silent> <S-Left> 3<C-w><
nmap <silent> <S-Right> 3<C-w>>

" Buffer switching
nmap <Left> :bp<CR>
nmap <Right> :bn<CR>

" Tab navigation
" noremap <silent> <Esc>h :tabprev<CR>
" noremap <silent> <Esc>l :tabnext<CR>
" noremap <silent> <Esc>t :tabnew<CR>
" noremap <silent> <Esc>c :tabclose<CR>
" noremap <silent> <leader>t :tabnew<CR>

" Toggle fold
noremap <space> za

" go to next tag match
map <C-\> :tnext<CR>

" Press Shift+P while in visual mode to replace the selection without
" overwriting the default register
" vmap <silent> P p :call setreg('"', getreg('0')) <CR>
" vnoremap <silent> p "_xp"
" vnoremap <silent> P "_xP"

" toggle wrapping
noremap <silent> <leader>w :set invwrap<Bar>set wrap?<CR>

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
nnoremap <silent> [= ?\v^[<=>]{7}( .*\|$)<CR>
nnoremap <silent> ]= /\v^[<=>]{7}( .*\|$)<CR>

" Hide search highlighting
nnoremap <silent> <CR> :noh<CR><CR>

" close and *delete* current file
nmap <leader>x :Unlink<CR>

" close current window
" nmap <leader>q <C-w>q

" kill (close) current window
nnoremap K <C-w>q

" Switch to prev buffer
map <leader><leader> <C-^>

" reflow paragraph with Q in normal and visual mode
nnoremap Q gqip
vnoremap Q gq

map <F5> :call RefreshWithTags()<CR>
map <F6> :make<CR>

vmap gx "9y:w !xdg-open '<C-R>=@9<CR>'<CR>
nmap gx viWgx

" " Remap the tab key to do autocompletion or indentation depending on the
" " context (from http://www.vim.org/tips/tip.php?tip_id=102)
" function! InsertTabWrapper()
"     let col = col('.') - 1
"     if !col || getline('.')[col - 1] !~ '\k'
"         return "\<tab>"
"     else
"         return "\<c-p>"
"     endif
" endfunction
" inoremap <tab> <c-r>=InsertTabWrapper()<cr>
" inoremap <s-tab> <c-n>

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

function! ToggleNumbering()
  if &relativenumber
    set number
  else
    set relativenumber
  endif
endfunc

noremap <leader>n :call ToggleNumbering()<cr>

""""""""""""""""
" Autocommands "
""""""""""""""""

augroup misc
  au!

  " jump to last position when opening a file,
  " don't do it when writing a commit log entry
  au BufReadPost *
      \ if &filetype !~ 'commit\c' |
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \ exe "normal g`\"" |
      \ endif |
      \ endif

  " cursorline auto show/hide
  au CursorMoved,CursorMovedI * if &cul | set nocursorline | endif
  au CursorHold,CursorHoldI * set cursorline

  " open help in vertical split
  au BufWinEnter *.txt,*.txt.gz if &ft == 'help' | wincmd L | endif

  " autocmd FileType html,eruby if g:html_indent_tags !~ '\\|p\>' | let g:html_indent_tags .= '\|p\|li\|dt\|dd' | endif

  au Filetype *
    \   if &omnifunc == "" |
    \     setlocal omnifunc=syntaxcomplete#Complete |
    \   endif

  " Save all buffers on FocusLost
  au FocusLost * :silent! wall

  " Disable paste mode when leaving Insert Mode
  au InsertLeave * set nopaste

  " Resize splits when the window is resized
  au VimResized * exe "normal! \<c-w>="

  " Load .vimrc after save
  au BufWritePost .vimrc source ~/.vimrc

  " noignorecase in insert mode only
  autocmd InsertEnter * set noic
  autocmd InsertLeave * set ic
augroup END

"""""""""""""""""
" Abbreviations "
"""""""""""""""""

ia mk/ http://ku1ik.com/
ia gh/ https://github.com/
ia ghs/ https://github.com/sickill/

cabbr Q q

"""""""""""
" Plugins "
"""""""""""

runtime functions.vim

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'vim-ruby/vim-ruby'

Bundle 'mileszs/ack.vim'
map <leader>a :Ack!<Space>

Bundle 'endwise.vim'
Bundle 'edsono/vim-matchit'
Bundle 'tpope/vim-rails'
Bundle 'surround.vim'
Bundle 'repeat.vim'
Bundle 'plasticboy/vim-markdown'
Bundle 'timcharper/textile.vim'
Bundle 'pangloss/vim-javascript'

Bundle 'ZoomWin'
map <leader>z :ZoomWin<CR>

Bundle 'michaeljsmith/vim-indent-object'

Bundle 'tpope/vim-fugitive'
nmap <leader>gw :Gwrite<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gc :Gcommit -v<CR>
nmap <leader>gd :Gdiff<CR>
autocmd BufReadPost fugitive://* set bufhidden=delete
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif

" Bundle 'msanders/snipmate.vim'
" let g:snippets_dir = "~/.vim/snippets"
" source ~/.vim/snippets/support_functions.vim

Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/snipmate-snippets'
let g:snips_trigger_key = '<C-e>'
let g:snips_trigger_key_backwards = '<S-M-e>'

Bundle 'jgdavey/vim-blockle'
let g:blockle_mapping = '<leader>b'

Bundle 'tpope/vim-commentary'

Bundle 'tpope/vim-unimpaired'
" bubble current line
nmap <M-j> ]eV=
nmap <M-k> [eV=
" bubble visual selection lines
vmap <M-j> ]egv=gv
vmap <M-k> [egv=gv

Bundle 'BufOnly.vim'
Bundle 'nginx.vim'
Bundle 'vim-json-bundle'
" Bundle 'greplace.vim'

" Bundle 'Syntastic'
" let g:syntastic_enable_signs = 1
" let g:syntastic_disabled_filetypes = ['eruby']

Bundle 'bingaman/vim-sparkup'

Bundle 'altercation/vim-colors-solarized'
let g:solarized_contrast = "high"
" " let g:solarized_termcolors = 256

Bundle 'tpope/vim-bundler'

Bundle 'vimwiki'
nmap <silent> <Leader>_ww <Plug>VimwikiIndex
nmap <silent> <Leader>_wt <Plug>VimwikiTabIndex
nmap <silent> <Leader>_ws <Plug>VimwikiUISelect
nmap <silent> <Leader>_wi <Plug>VimwikiDiaryIndex
nmap <silent> <Leader>_w<Leader>w <Plug>VimwikiMakeDiaryNote
nmap <silent> <Leader>_w<Leader>t <Plug>VimwikiTabMakeDiaryNote

Bundle 'tpope/vim-abolish'

Bundle 'sickill/vim-pasta'
" let g:pasta_enabled_filetypes = ['ruby']
" let g:pasta_disabled_filetypes = ['python']

Bundle 'vim-coffee-script'
" Bundle 'briancollins/vim-jst'
Bundle 'godlygeek/tabular'

Bundle 'ervandew/supertab'
" let g:SuperTabDefaultCompletionType = "context"
" let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']

Bundle 'tpope/vim-eunuch'
ca w!! SudoWrite
nmap <leader>mv :Rename %%

" Bundle 'Lokaltog/vim-powerline'
" let g:Powerline_symbols = "unicode"

Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = '-'
let g:ctrlp_lazy_update = 1
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_max_depth = 10
let g:ctrlp_jump_to_buffer = 0
nmap <leader>e :CtrlP %%<CR>
nmap <Leader>- :CtrlPBuffer<CR>
" let g:ctrlp_by_filename = 1
" let g:ctrlp_working_path_mode = 0

Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
let g:gist_clip_command = 'xclip -selection clipboard'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" Bundle 'sickill/vim-git-inline-diff'

" Bundle 'nathanaelkane/vim-indent-guides'
" Bundle 'wookiehangover/jshint.vim'
" Bundle 'manalang/jshint.vim'

Bundle 'nono/vim-handlebars'

let g:netrw_liststyle = 3
" Bundle 'scrooloose/nerdtree'
" nmap <silent> <leader>n :NERDTreeToggle<CR>
" let NERDTreeMapOpenSplit = "s"
" let NERDTreeMapOpenVSplit = "v"
" let NERDTreeMinimalUI = 1

" Bundle 'jgdavey/tslime.vim'
" Bundle 'jgdavey/vim-turbux'

" Bundle 'godlygeek/csapprox'
Bundle 'kana/vim-smartinput'

filetype plugin indent on " enable indendation/internal plugins after Vundle

""""""""""""""""""""""""""""""""""""""
" Syntax highlighting & color scheme "
""""""""""""""""""""""""""""""""""""""

syntax enable " Turn on syntax highlighting

if (&term == "linux")
  " colors ???
else
  " Colors for console
  if !has("gui_running")
    set t_Co=256 " Explicitly tell vim that the terminal has 256 colors
  endif

  " set background=dark
  " colors grb256
  " if (g:colors_name == "grb256")
  "   hi ColorColumn guibg=#111
  " endif
  colors Monokai
  " colo smyck
  " colors madeofcode
  " colors giant-goldfish
  " colors molokai
  " colors Sunburst
  " colors Twilight
  " set background=dark
  " colors solarized
  " colors mustang
  " colors wombat256mod
  " colors jellybeans
endif

" Finally load local config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
