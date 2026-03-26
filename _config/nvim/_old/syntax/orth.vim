scriptencoding utf-8

syn match orthComment /;.*$/
" syn match orthSpecial /#t\|#f\|#sentinel/
" syn match orthSymbol /:\S*/
" syn match orthString /"\_[^"]\{-}"/
" syn match orthNumber /\<+\|\-*[0-9]\+\>/
" syn match orthNumber /\<+\|\-*[0-9]\+\.\?[0-9]*\>/
syn match orthQuote /{\|}a\|}q\|}/
syn match orthDef /@value\|@record\|@type-info\|@doc\|@/

highlight link orthComment Comment
" highlight link orthSpecial Boolean
" highlight link orthSymbol Symbol
" highlight link orthNumber Constant
" highlight link orthString Constant
