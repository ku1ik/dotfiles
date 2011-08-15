" Font for gui
set guifont=Droid\ Sans\ Mono\ 9
set linespace=1

set guioptions-=R
set guioptions-=r
set guioptions-=l
set guioptions-=L
set guioptions-=T
set guioptions-=m
set guioptions+=c

" Tab tooltip format
set gtt=%F

autocmd VimEnter * call s:CdIfDirectory(expand("<amatch>"))

" If the parameter is a directory, cd into it
function! s:CdIfDirectory(directory)
  let explicitDirectory = isdirectory(a:directory)
  let directory = explicitDirectory || empty(a:directory)

  if explicitDirectory
    exe "cd " . a:directory
  endif
endfunction

" Load local config
if filereadable(expand("~/.gvimrc.local"))
  source ~/.gvimrc.local
endif
