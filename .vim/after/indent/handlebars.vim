" indent in <li>, <p> etc
if g:html_indent_tags !~ '\\|p\>'
  let g:html_indent_tags .= '\|p\|li\|dt\|dd'
endif
