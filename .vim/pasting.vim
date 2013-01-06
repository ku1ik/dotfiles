function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

" on enter/leave termcap mode (on vim start/quit ?)
" let &t_ti = WrapForTmux("\<Esc>[?2004h") . &t_ti
" let &t_te = WrapForTmux("\<Esc>[?2004l") . &t_te

" on enter/leave insert mode
let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin(ret)
  set pastetoggle=<Esc>[201~
  set paste
  return a:ret
endfunction!!!

" inoremap <esc> <esc><nop>
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")

" execute "set <f28>=\<Esc>[200~"
" execute "set <f29>=\<Esc>[201~"
" map <expr> <f28> XTermPasteBegin("i")
" imap <expr> <f28> XTermPasteBegin("")
" vmap <expr> <f28> XTermPasteBegin("c")
" cmap <f28> <nop>
" cmap <f29> <nop>

" if &term =~ "xterm"
    " let &t_ti .= "\e[?2004h"
    " let &t_te .= "\e[?2004l"
    " let &pastetoggle = "\e[201~"

    " function! XTermPasteBegin(ret)
    "     set paste
    "     return a:ret
    " endfunction

    " noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
    " inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
    " cnoremap <special> <Esc>[200~ <nop>
    " cnoremap <special> <Esc>[201~ <nop>
" endif

" let &t_SI .= "\e[?2004h"
" let &t_EI .= "\e[?2004l"
" let &pastetoggle = "\e[201~"

" function! XTermPasteBegin(ret)
"   set paste
"   return a:ret
" endfunction

" inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
