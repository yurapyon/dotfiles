" TODO
"    move colors out of here
"    ctrl-h in terminal
"    pathogen to something else?
"    add more things todo like lowercase todo, note, etc
"    figure out the right way to do those mappings

execute pathogen#infect()

" == settings ==

" ins spaces on tab
set expandtab

" tab size
set shiftwidth=2
set tabstop=2

" line numbers
set number

" put file position in status bar
set ruler

" wrap lines
set wrap
set textwidth=0
set wrapmargin=0

" show tabs n spaces
set list

" delete tabs backwards
set smarttab

" smart indent on { and }
set smartindent

" copy last indent
set autoindent

" show unfinished command in status bar
set showcmd

" allow to move cursor anywhere in indent mode
set virtualedit=insert

" splits
set splitbelow
set splitright

" folds
set fdm=marker
set fdl=3

" searching
set ignorecase
set smartcase

" extra lines around cursor
set scrolloff=4

" dont show status bar
set laststatus=0

" == mappings ==

" haha
noremap ; :
" noremap : ;

map q: <nop>
nnoremap Q <nop>

map <Enter> o<Esc>

cmap W! w !sudo tee > /dev/null %

" sudo save
" command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!

" noremap <F3> :call system('scons -Q')<CR>

let matched = 0
function! Match81()
  if g:matched
    call matchdelete(g:matched)
    let g:matched = 0
  else
    let g:matched = matchadd('Color81', '\%>80v.\+', 100)
  endif
endf

let mapleader="\<Space>"
map <Leader>( vi(
map <Leader>p <ESC>:sil '<,'>:w !luajit -e 'require("socket").udp():sendto(io.read("*a"), "127.0.0.1", 33333)'<CR>
map <Leader>m :call Match81()<CR>
map <Leader>r :set rnu!<CR>

" == filetypes ==

let g:c_syntax_for_h = 1
au FileType c   set shiftwidth=4
au FileType cpp set shiftwidth=4

" == colors lol ==

" lmao nice..
syntax on

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

hi Color81    ctermfg=Black    ctermbg=Red  cterm=bold

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

"let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
"execute "set rtp+=" . g:opamshare . "/merlin/vim"
