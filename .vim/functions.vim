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

function! RefreshGemsTags()
  let gems_path = system("echo '`bundle show rails`/../*'")
  call system("ctags -f ./gems-tags -R --sort=yes --fields=+l " . gems_path)
endfunction

function! RefreshWithTags()
  call Refresh()
  call system(".git/hooks/ctags")
endfunction
