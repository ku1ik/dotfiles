" formatting XML files with autoindent (=)
setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" auto closing of tags
inoremap <buffer> </ </<C-x><C-o><ESC>s>
