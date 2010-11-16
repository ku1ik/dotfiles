" Font for gui
set guifont=Droid\ Sans\ Mono\ 9
set linespace=2

set guioptions-=R
set guioptions-=r
set guioptions-=l
set guioptions-=L
set guioptions-=T
set guioptions-=m
set guioptions+=c

" Tab tooltip format
set gtt=%F

" Open NERDTree at start
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" Load local config
if filereadable(expand("~/.gvimrc.local"))
  source ~/.gvimrc.local
endif
