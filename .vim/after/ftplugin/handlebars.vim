setlocal omnifunc=htmlcomplete#CompleteTags
setlocal commentstring={{!%s}}

" auto closing of tags
inoremap <buffer> </ </<C-x><C-o><ESC>s>
