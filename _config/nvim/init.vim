" vim plug

call plug#begin('~/.local/share/nvim/vim-plug')

Plug 'eraserhd/parinfer-rust', {'do': 'cargo build --release'}

call plug#end()

let g:parinfer_mode='indent'

" c/c++

let g:c_syntax_for_h = 1
au FileType c set shiftwidth=4
au FileType cpp set shiftwidth=4

"

set expandtab

set shiftwidth=2
set tabstop=2

set number
set numberwidth=3

set list
set listchars=tab:_\ ,trail:.,

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

set splitbelow
set splitright

"

colo mochi
