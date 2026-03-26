syntax enable
filetype plugin indent on

" c/c++

let g:c_syntax_for_h = 1
au FileType c set shiftwidth=4
au FileType cpp set shiftwidth=4
au FileType glsl set shiftwidth=4

" ===

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

map <MiddleMouse> <nop>
map <2-MiddleMouse> <nop>
map <3-MiddleMouse> <nop>
map <4-MiddleMouse> <nop>

vmap <Leader>c :norm 0i// <CR>
vmap <Leader>C :norm ^xxx<CR>

map Q <nop>

set mouse=a

set splitbelow
set splitright

" ===

colo mochi

lua require("config.lazy")

" lua vim.lsp.enable('ts_ls')
