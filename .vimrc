set nocompatible
set backspace=indent,eol,start
set history=1000
set nobackup
set ruler
set showcmd
set showmode
set incsearch
set number
set noswapfile
"set cursorline
set nowrap
set completeopt=

if ! has("gui_running") 
  set t_Co=256 
endif 

"set background=dark
colors molokai

au BufReadPost Rules set syntax=ruby
au BufReadPost Rakefile set syntax=ruby
au BufReadPost Gemfile set syntax=ruby
au BufReadPost *.rake set syntax=ruby
au BufNewFile,BufRead *.less set filetype=less
au BufNewFile,BufRead *.scala set filetype=scala
au BufNewFile,BufRead *.md set filetype=mkd

helptags ~/.vim/doc

"au BufReadPost * hi CursorLine cterm=NONE ctermbg=black guibg=black

set statusline=%f "tail of the filename
set statusline+=%h      "help file flag
set statusline+=\ 
set statusline+=%y      "filetype
set statusline+=\ 
set statusline+=%r      "read only flag
set statusline+=%m      "modified flag
set statusline+=\ 
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
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
map <C-t> :FuzzyFinderTextMate<CR>

"NERD commenter
nnoremap <C-_> :call NERDComment(0, "toggle")<CR>
vnoremap <C-_> <ESC>:call NERDComment(1, "toggle")<CR>

