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
set numberwidth=3

" put file position in status bar
set ruler

" wrap lines
set nowrap
set textwidth=0
set wrapmargin=0

" show tabs n spaces
set list
set listchars=tab:_\ ,trail:-,

" delete tabs backwards
set smarttab

" smart indent on { and }
set smartindent

" copy last indent
set autoindent

" show unfinished command in status bar
set showcmd

" allow to move cursor anywhere in insert mode
" set virtualedit=insert

" live updates
" set inccommand=split

" better redraw
set lazyredraw

" use mouse
set mouse=a

" splits
set splitbelow
set splitright

" folds
set foldmethod=marker
set foldlevel=3

" searching
set ignorecase
set smartcase

" extra lines around cursor
set scrolloff=4

" dont show status bar
" set laststatus=0

"
set nobackup

" == mappings ==

" haha
noremap ; :
" noremap : ;

" comments
inoremap # X<BS>#

map q: <nop>
map Q  <nop>

nmap <Left>  <nop>
nmap <Right> <nop>
nmap <Up>    <nop>
nmap <Down>  <nop>

imap <LeftMouse> <nop>
imap <2-LeftMouse> <nop>
imap <3-LeftMouse> <nop>
imap <4-LeftMouse> <nop>
imap <LeftDrag> <nop>

nnoremap C cc<Esc>

map <Enter> o<Esc>

cmap W! w !sudo tee > /dev/null %

let g:matched = 0
function! Match81()
  if g:matched
    call matchdelete(g:matched)
    let g:matched = 0
  else
    let g:matched = matchadd('Color81', '\%>80v.\+', 100)
  endif
endf

let mapleader="\<Space>"
"map <Leader>( vi(
"map <Leader>p <ESC>:sil '<,'>:w !luajit -e 'require("socket").udp():sendto(io.read("*a"), "127.0.0.1", 33333)'<CR>
map <Leader>p <ESC>:sil '<,'>:w !luajit -e 'require("luasend").send(io.read("*a"))'<CR>
map <Leader>a <ESC>:sil :w !luajit -e 'require("luasend").send(io.read("*a"))'<CR>
map <Leader>m :call Match81()<CR>
map <Leader>r :set rnu!<CR>
map <Leader><CR> :noh<CR>

au FileType lua let b:comment_leader = '-- '
au FileType c,cpp let b:comment_leader = '// '
au FileType crystal,ruby let b:comment_leader = '# '
au FileType scheme let b:comment_leader = '; '
noremap <silent> <Leader>c :<C-B>sil <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:noh<CR>
noremap <silent> <Leader>u :<C-B>sil <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:noh<CR>

map <F9> :source $MYVIMRC<CR>
map <F10> :vsp $MYVIMRC<CR>

map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l

imap <C-H> <Left>
imap <C-J> <Down>
imap <C-K> <Up>
imap <C-L> <Right>

map <C-A> <ESC>0ggvG$

" == filetypes ==

let g:c_syntax_for_h = 1
au FileType c set shiftwidth=4
au FileType cpp set shiftwidth=4

" == colors lol ==

" lmao nice..
let is_chicken = 1
syntax on
syntax reset

set background=dark
hi clear

" hi Normal     ctermfg=black
hi Comment    ctermfg=gray
hi Constant   ctermfg=magenta
hi Special    ctermfg=darkmagenta
hi Identifier ctermfg=cyan                  cterm=bold
hi Statement  ctermfg=green
hi PreProc    ctermfg=blue
hi Type       ctermfg=green
hi Function   ctermfg=magenta               cterm=bold
hi Repeat     ctermfg=white
hi Operator   ctermfg=magenta
hi Ignore     ctermfg=black
hi Error      ctermfg=white    ctermbg=red
hi Todo       ctermfg=yellow   ctermbg=none cterm=bold
hi Delimiter  ctermfg=gray
hi Search     ctermfg=black ctermbg=darkblue cterm=bold

hi StatusLine   ctermfg=black   ctermbg=white
hi StatusLineNC ctermfg=magenta ctermbg=white
hi VertSplit    ctermfg=magenta ctermbg=white

hi Color81 ctermfg=black ctermbg=red  cterm=bold

hi LineNr               ctermfg=grey                 cterm=bold
hi CursorLineNr         ctermfg=green  ctermbg=black cterm=bold
hi cUserFunction        ctermfg=white
hi cUserFunctionPointer ctermfg=white

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

syntax keyword todo todo xxx fixme note
hi link todo Todo

" au FileType scheme syntax keyword schemeTodo todo xxx fixme note
au FileType scheme hi link schemeTodo Todo
au FileType scheme syn clear schemeError
