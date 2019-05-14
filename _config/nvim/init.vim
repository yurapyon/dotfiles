" vim plug

call plug#begin('~/.local/share/nvim/vim-plug')

Plug 'kovisoft/slimv'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()



" ins spaces on tab
set expandtab

" tab size
set shiftwidth=2
set tabstop=2

" line numbers
set number
set numberwidth=3

" show tabs and trailing spaces
set list
set listchars=tab:_\ ,trail:-,

set scrolloff=4

set ignorecase
set smartcase

map <CR> o<Esc>

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
