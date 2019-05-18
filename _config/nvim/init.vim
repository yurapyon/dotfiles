" vim plug

call plug#begin('~/.local/share/nvim/vim-plug')

Plug 'kovisoft/slimv'
Plug 'eraserhd/parinfer-rust', {'do': 'cargo build --release'}
Plug 'ap/vim-css-color'

call plug#end()

" lisp stuff

"let g:lisp_rainbow=1

let g:slimv_impl='sbcl'
let g:slimv_leader='\'
let g:slimv_keybindings=2
let g:slimv_repl_split=0
let g:slimv_repl_syntax=0

let g:paredit_mode=0

" todo open files in paren mode then keybinds for smart indent and paren mode
let g:parinfer_mode='indent'

set expandtab

set shiftwidth=2
set tabstop=2

set number
set numberwidth=3

set list
set listchars=tab:_\ ,trail:-,

set scrolloff=4

set ignorecase
set smartcase

au BufEnter * set fo-=c fo-=r fo-=o

" map <CR> o<Esc>

let mapleader="\<Space>"
map <Leader><CR> :noh<CR>

nmap <Left>  <nop>
nmap <Right> <nop>
nmap <Up>    <nop>
nmap <Down>  <nop>

set mouse=a

imap <LeftMouse> <nop>
imap <2-LeftMouse> <nop>
imap <3-LeftMouse> <nop>
imap <4-LeftMouse> <nop>
imap <LeftDrag> <nop>

colo mochi
