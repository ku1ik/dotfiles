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

" move up/down by screen lines, not file lines
nnoremap j gj
nnoremap k gk

" easier way to get out of insert mode
" inoremap jk <esc>
" inoremap jj <esc>
" inoremap <esc> <nop>

" Preserve selection when indenting
vmap > >gv
vmap < <gv

" Easy (de)indent
" nnoremap <M-h> <<
" nnoremap <M-l> >>

" allow moving with Ctrl + h/j/k/l in insert mode
" inoremap <c-h> <Left>
" inoremap <c-j> <Down>
" inoremap <c-k> <Up>
" inoremap <c-l> <Right>

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
noremap <silent> <Esc>h :tabprev<CR>
noremap <silent> <Esc>l :tabnext<CR>
noremap <silent> <Esc>t :tabnew<CR>
noremap <silent> <Esc>c :tabclose<CR>

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

" Search prompt
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

""""""""""""""""
" Autocommands "
""""""""""""""""

augroup misc
  au!

  " commentstrings
  au FileType xdefaults set commentstring=!\ %s
  au FileType tmux set commentstring=#\ %s

  " filetype detection
  au BufRead,BufNewFile Gemfile,Rakefile,Thorfile,config.ru,Rules,Vagrantfile,Guardfile,Capfile set ft=ruby
  au BufRead,BufNewFile nginx.conf,/etc/nginx/**/* set ft=nginx
  au BufRead,BufNewFile *.less set ft=less
  au BufNewFile,BufReadPost .tmux.conf*,tmux.conf* set ft=tmux
  au BufRead,BufNewFile *.mustache set ft=mustache
  au BufRead,BufNewFile .pentadactylrc set ft=vim

  " wrapping and spell-checking for markdown files
  au FileType mkd setlocal wrap wm=2 textwidth=79 spell

  " make python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
  au FileType python setlocal softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79 colorcolumn=80

  " autoindent for yaml files
  au BufRead,BufNewFile *.{yml,yaml} setlocal autoindent

  " formatting XML/JSON files with autoindent (=)
  au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
  au FileType json setlocal equalprg=python\ -m\ json.tool

  " jump to last position when opening a file,
  " don't do it when writing a commit log entry
  au BufReadPost *
      \ if &filetype !~ 'commit\c' |
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \ exe "normal g`\"" |
      \ endif |
      \ endif

  au CursorMoved,CursorMovedI * if &cul | set nocursorline | endif
  au CursorHold,CursorHoldI * set cursorline

  " open help in vertical split
  au BufWinEnter *.txt,*.txt.gz if &ft == 'help' | wincmd L | endif

  " ? in ruby is a part of a method
  au Filetype ruby setlocal iskeyword+=?

  " dash in CSS is a part of a keyword
  au Filetype css setlocal iskeyword+=-

  " no colorcolumn for quickfix
  au Filetype qf setlocal colorcolumn=

  " makeprgs
  au FileType ruby setlocal makeprg=ruby\ \%
  " au BufRead,BufNewFile *_spec.rb setlocal makeprg=rspec\ \%
  au FileType python setlocal makeprg=python\ \%
  au FileType sh setlocal makeprg=sh\ \%

  " custom foldmethod
  au FileType python,coffee setlocal foldmethod=indent

  " autocmd FileType html,eruby if g:html_indent_tags !~ '\\|p\>' | let g:html_indent_tags .= '\|p\|li\|dt\|dd' | endif

  " completion
  au FileType css,scss call SuperTabSetDefaultCompletionType("<c-x><c-o>")

  au Filetype *
    \   if &omnifunc == "" |
    \     setlocal omnifunc=syntaxcomplete#Complete |
    \   endif

augroup END

"""""""""""""""""
" Abbreviations "
"""""""""""""""""

augroup abbrevs
  au!

  " Ruby
  au Filetype ruby ia log/ Rails.logger.debug
  au Filetype ruby ia pry/ require 'pry'; binding.pry;
  au Filetype ruby ia debug/ require 'ruby-debug'; debugger;
  " au FileType ruby inorea <buffer> def def<CR>end<ESC>-A
  " au FileType ruby inorea <buffer> class class<CR>end<ESC>-A
  " au FileType ruby inorea <buffer> module module<CR>end<ESC>-A

  " RSpec
  au Filetype ruby ia desc/ describe "" do<CR><ESC>?""<ESC>a
  au Filetype ruby ia cont/ context "" do<CR><ESC>?""<ESC>a
  au Filetype ruby ia it/ it "" do<CR><ESC>?""<ESC>a
  au Filetype ruby ia sub/ subject do<CR><BS><SPACE>
  au Filetype ruby ia bef/ before do<CR><BS><SPACE>
  au Filetype ruby ia let/ let(:) { }<ESC>F:a

  " au Filetype ruby ia d/ do \|ppp\|<CR><ESC>?ppp<ESC>ciw

  " Coffee
  au Filetype coffee ia log/ console.log

  " Javascript
  au Filetype javascript ia log/ console.log()<left>
  au Filetype javascript ia f/ function() {<CR><BS><SPACE><CR>}<ESC>?{<CR>j$a
  au Filetype javascript ia f- function() { }<ESC>?{<ESC>a
augroup END

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

" Bundle 'altercation/vim-colors-solarized'
" let g:solarized_contrast = "high"
" " let g:solarized_termcolors = 256

Bundle 'tpope/vim-bundler'

Bundle 'vimwiki'
nmap <silent><unique> <Leader>_ww <Plug>VimwikiIndex
nmap <silent><unique> <Leader>_wt <Plug>VimwikiTabIndex
nmap <silent><unique> <Leader>_ws <Plug>VimwikiUISelect
nmap <silent><unique> <Leader>_wi <Plug>VimwikiDiaryIndex
nmap <silent><unique> <Leader>_w<Leader>w <Plug>VimwikiMakeDiaryNote
nmap <silent><unique> <Leader>_w<Leader>t <Plug>VimwikiTabMakeDiaryNote

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
let g:ctrlp_map = '<Leader>-'
let g:ctrlp_lazy_update = 1
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_max_depth = 10
let g:ctrlp_jump_to_buffer = 0
nmap <leader>e :CtrlP %%<CR>
nmap - :CtrlPBuffer<CR>
" let g:ctrlp_by_filename = 1
" let g:ctrlp_working_path_mode = 0

Bundle 'mattn/gist-vim'
let g:gist_clip_command = 'xclip -selection clipboard'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" Bundle 'sickill/vim-git-inline-diff'

" Bundle 'Raimondi/delimitMate'
" Bundle 'Townk/vim-autoclose'
" Bundle 'nathanaelkane/vim-indent-guides'
" Bundle 'wookiehangover/jshint.vim'
" Bundle 'manalang/jshint.vim'

Bundle 'nono/vim-handlebars'

Bundle 'scrooloose/nerdtree'
nmap <silent> <leader>n :NERDTreeToggle<CR>
let NERDTreeMapOpenSplit = "s"
let NERDTreeMapOpenVSplit = "v"
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Bundle 'godlygeek/csapprox'

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
  " colors Monokai
  colors madeofcode
  " colors giant-goldfish
  " colors molokai
  " colors Sunburst
  " colors Twilight
  " set background=dark
  " colors solarized
endif

" Finally load local config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
