" Vim color file
" Maintainer: Roman Gonzalez <romanandnreg at gmail dot com>
" Last Change: 2009 Aug 11
" Version: 0.0.1
" Screenshot: http://img.skitch.com/20090811-ti4b27qbftjybmau32ruygjjwx.jpg
" URL: http://blog.romanandreg.com
 
" For now this will only work on gvim
 
set background=dark
highlight clear
if exists("syntax_on")
  syntax reset
endif
 
let g:colors_name = "sunburst"
 
if has("gui_running")
 
  highlight lineNr guifg=#888888 guibg=#DEDEDE
  highlight VertSplit guifg=#DEDEDE guibg=#888888
  highlight IncSearch guibg=#16181A
  highlight Cursor guibg=#DDDDDD
  highlight Search guibg=#16181A guifg=NONE
  highlight MatchParen guibg=#DDDDDD guifg=#000000
 
" Some defaults for all languages
  highlight Normal guifg=White guibg=Black
  highlight Keyword guifg=#CE864B guibg=Black
  highlight Include   guifg=#CE864B guibg=Black
  highlight Define guifg=#CE864B guibg=Black
  highlight Statement guifg=#CE864B guibg=Black
  highlight Function guifg=#89BDFF guibg=Black
  highlight Comment guifg=#AEAEAE guibg=Black gui=bold
  highlight SpecialComment guifg=#AEAEAE guibg=Black gui=bold
  highlight Type guifg=White gui=NONE
  highlight Constant guifg=#3387CC guibg=Black
  highlight String guifg=#65B042 guibg=Black
  highlight Title guifg=#FFFFFF guibg=Black
  highlight Todo guifg=#FFFFFF guibg=Black gui=underline

" HTML
  highlight htmlTag guifg=#80BDF7 guibg=Black
  highlight htmlEndTag guifg=#80BDF7 guibg=Black
  highlight htmlTagName guifg=#80BDF7 guibg=Black
  highlight htmlArg guifg=#80BDF7 guibg=Black
 
" Ruby specific highlight
  highlight rubyClass guifg=#CE864B guibg=Black
  highlight rubyInterpolationDelimiter guifg=#DAEFA0 guibg=Black
  highlight rubySymbol guifg=#3387CC guibg=Black
  highlight rubyConstant guifg=#3387CC guibg=Black
  highlight rubyStringDelimiter guifg=#65B042 guibg=Black
  highlight rubyBlockParameter guifg=#3387CC guibg=Black
  highlight rubyInstanceVariable guifg=#3387CC guibg=Black
  highlight rubyInclude guifg=#CE864B guibg=Black
  highlight rubyGlobalVariable guifg=#3387CC guibg=Black
 
" Rails specific highlight
  highlight rubyRailsMethod guifg=#DAD085 guibg=Black
  highlight rubyRailsUserClass guifg=#89BDFF guibg=Black gui=underline
  highlight railsConditionsSpecial guifg=#DAEFA0 guibg=Black

 
" Rails: erb
  highlight erubyDelimiter guifg=#FFFFFF guibg=Black
  highlight erubyRailsRenderMethod guifg=#DAD085 guibg=Black
  highlight erubyRailsHelperMethod guifg=#DAD085 guibg=Black
  highlight javascriptRailsFunction guifg=#CE864B guibg=Black
" Rails: haml
  highlight hamlTag guifg=#80BDF7 guibg=Black
  highlight hamlClassChar guifg=#DAEFA0 guibg=Black
  highlight hamlClass guifg=#DAEFA0 guibg=Black
  highlight hamlIdChar guifg=#DAD085 guibg=Black
  highlight hamlId guifg=#DAD085 guibg=Black
  highlight hamlAttributesDelimiter guifg=#FFFFFF guibg=Black
  highlight hamlRubyOutputChar guifg=#FFFFFF guibg=Black
  highlight hamlObjectDelimiter guifg=#FFFFFF guibg=Black
 
" Javascript specific highlight
  highlight javaScript guifg=#FFFFFF guibg=Black
  highlight javaScriptIdentifier guifg=#3387CC guibg=Black
  highlight javaScriptCommentTodo guifg=#AEAEAE guibg=NONE
  highlight javaScriptBraces guifg=#FFFFFF guibg=Black
  highlight javaScriptFunction guifg=#99C843 guibg=Black
  highlight javaScriptType guifg=#94859D guibg=Black
  highlight javaScriptMember guifg=#94859D guibg=Black
  highlight javaScriptGlobal guifg=#94859D guibg=Black
  highlight javaScriptRegexpString guifg=#E1C062 guibg=Black
 
endif
