" vim plug

call plug#begin('~/.local/share/nvim/vim-plug')

Plug 'kovisoft/slimv'
Plug 'eraserhd/parinfer-rust', {'do': 'cargo build --release'}
Plug 'ap/vim-css-color'
Plug 'JuliaEditorSupport/julia-vim'

call plug#end()

" lisp
" todo open files in paren mode then keybinds for smart indent and paren mode

"let g:lisp_rainbow=1

let g:slimv_impl='sbcl'
let g:slimv_leader='\'
let g:slimv_keybindings=2
let g:slimv_repl_split=0
let g:slimv_repl_syntax=0

let g:paredit_mode=0

let g:parinfer_mode='indent'

" c/c++

let g:c_syntax_for_h = 1
au FileType c set shiftwidth=4
au FileType cpp set shiftwidth=4

" juila

let g:latex_to_unicode_cmd_mapping = '<C-\><Tab>'

"

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

let mapleader="\<Space>"
map <Leader><CR> :noh<CR>

nmap <Left>  <nop>
nmap <Right> <nop>
nmap <Up>    <nop>
nmap <Down>  <nop>

imap <LeftMouse> <nop>
imap <2-LeftMouse> <nop>
imap <3-LeftMouse> <nop>
imap <4-LeftMouse> <nop>
imap <LeftDrag> <nop>

set mouse=a

"

command Cdrc :cd ~/dotfiles/_config/nvim/

colo mochi
