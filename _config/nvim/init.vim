execute pathogen#infect()

set expandtab
set shiftwidth=2
set number
set ruler
syntax on
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0
set smartcase
set smarttab
set smartindent
set autoindent
set showcmd

" splits
set splitbelow
set splitright

map q: <nop>
nnoremap Q <nop>

cmap w!! w !sudo tee > /dev/null %

map <F2> :set rnu!<CR>
noremap <F3> :call system('scons -Q')<CR>

set fdm=marker
set fdl=3

au FileType lua set cms=--%s
au FileType c set shiftwidth=4
au FileType cpp set shiftwidth=4

" lmao nice..
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

"hi Normal     ctermfg=Black
hi Comment    ctermfg=Gray
hi Constant   ctermfg=Magenta     
hi Special    ctermfg=DarkMagenta 
hi Identifier ctermfg=Cyan                  cterm=bold
hi Statement  ctermfg=Green
hi PreProc    ctermfg=Blue
hi Type       ctermfg=Green
hi Function   ctermfg=Magenta               cterm=bold
hi Repeat     ctermfg=White
hi Operator   ctermfg=Magenta
hi Ignore     ctermfg=Black
hi Error      ctermfg=White    ctermbg=Red
hi Todo       ctermfg=Yellow   ctermbg=None cterm=bold 
hi Delimiter  ctermfg=Gray

"hi LineNr               ctermfg=DarkGray             cterm=bold 
hi LineNr               ctermfg=Grey                 cterm=bold 
hi CursorLineNr         ctermfg=Green  ctermbg=Black cterm=bold
hi cUserFunction        ctermfg=White
hi cUserFunctionPointer ctermfg=White

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

"autocmd vimenter * NERDTree
"set omnifunc=syntaxcomplete#Complete
"filetype plugin on

"let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
"execute "set rtp+=" . g:opamshare . "/merlin/vim"
