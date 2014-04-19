function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

" on enter/leave insert mode
let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin(ret)
  set pastetoggle=<Esc>[201~
  set paste
  return a:ret
endfunction

" inoremap <esc> <esc><nop>
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
