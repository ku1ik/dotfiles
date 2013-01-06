" indent in <li>, <p> etc
if exists('g:html_indent_tags')
  if g:html_indent_tags !~ '\\|p\>'
    let g:html_indent_tags .= '\|p\|li\|dt\|dd'
  endif
endif
