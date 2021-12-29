highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "mochi"

set background="dark"

hi Comment    ctermfg=gray
hi Constant   ctermfg=magenta
hi Special    ctermfg=darkmagenta
hi Identifier ctermfg=cyan                      cterm=bold
hi Statement  ctermfg=green
hi PreProc    ctermfg=blue
hi Type       ctermfg=cyan
hi Function   ctermfg=magenta                   cterm=bold
hi Repeat     ctermfg=white
hi Operator   ctermfg=magenta
hi Ignore     ctermfg=black
hi Error      ctermfg=white       ctermbg=red
hi Todo       ctermfg=yellow      ctermbg=none  cterm=bold
hi Delimiter  ctermfg=gray
hi Search     ctermfg=blue        ctermbg=white cterm=bold

hi StatusLine   ctermfg=black ctermbg=white
hi StatusLineNC ctermfg=black ctermbg=gray
hi VertSplit    ctermfg=green ctermbg=white

hi TabLineFill   ctermfg=black ctermbg=none
hi TabLine       ctermfg=darkgray ctermbg=black
hi TabLineSel    ctermfg=yellow  ctermbg=black

hi LineNr               ctermfg=grey                cterm=bold
hi CursorLineNr         ctermfg=green ctermbg=black cterm=bold

hi cUserFunction        ctermfg=white
hi cUserFunctionPointer ctermfg=white

hi orthSymbol ctermfg=none
hi orthQuote  ctermfg=blue
hi orthDef    ctermfg=green

hi link String         Constant
hi link Character      Constant
hi link Number         Constant
hi link Boolean        Constant
hi link Float          Number
hi link Conditional    Repeat
hi link Label          Statement
hi link Keyword        Statement
hi link Exception      Statement
hi link Include        PreProc
hi link Define         PreProc
hi link Macro          PreProc
hi link PreCondit      PreProc
hi link StorageClass   Type
hi link Structure      Type
hi link Typedef        Type
hi link Tag            Special
hi link SpecialChar    Special
hi link SpecialComment Special
hi link Debug          Special
