" syntax reset
" syntax clear

let col0 = "AAAAAA"
let col1 = "69D2E7"
let col2 = "A7DBD8"
let col3 = "E0E4CC"
let col4 = "F38630"
let col5 = "FA6900"

exe "hi Comment    guifg=#" . col1 . " guibg=#000000 gui=NONE"
exe "hi Constant   guifg=#" . col2 . " guibg=#000000 gui=NONE"
exe "hi Identifier guifg=#" . col3 . " guibg=#000000 gui=NONE"
exe "hi Statement  guifg=#" . col4 . " guibg=#000000 gui=NONE"
exe "hi PreProc    guifg=#" . col5 . " guibg=#000000 gui=NONE"
exe "hi Type       guifg=#" . col4 . " guibg=#000000 gui=NONE"
exe "hi Special    guifg=#" . col3 . " guibg=#000000 gui=NONE"

exe "hi Normal    guifg=#" . col0 . " guibg=#000000 gui=NONE"

" syntax enable
" hi Underlined
" hi Ignore
" hi Error
" hi Todo

" CursorLine
" CursorIM
" CursorColumn
" CursorLine
" Directory
" DiffAdd
" DiffChange
" DiffDelete
" DiffText
" ErrorMsg
" VertSplit
" Folded
" FoldColumn
" SignColumn
" IncSearch
" LineNr
" MatchParen
" ModeMsg
" MoreMsg
" NonText
" Normal
" Pmenu
" PmenuSel
" PmenuSbar
" PmenuThumb
" Question
" Search
" SpecialKey
" SpellBad
" SpellCap
" SpellLocal
" SpellRare
" StatusLine
" StatusLineNC
" TabLine
" TabLineFill
" TabLineSel
" Title
" Visual
" VisualNOS
" WarningMsg
" WildMenu
