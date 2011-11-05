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

" Paste SELECTION with S-Insert
inoremap <S-Insert> <MiddleMouse>

" font size
command! -bar -nargs=0 Bigger  :let &guifont = substitute(&guifont,'\d\+$','\=submatch(0)+1','')
command! -bar -nargs=0 Smaller :let &guifont = substitute(&guifont,'\d\+$','\=submatch(0)-1','')
noremap <M--> :Smaller<CR>
noremap <M-=> :Bigger<CR>

" Tab tooltip format
set gtt=%F

set vb t_vb=                         " no visual nor audio bell

" colors Sunburst
" colors Twilight
" colors Monokai
colors solarized
" colors jellybeans

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
