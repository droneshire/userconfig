set nocompatible
filetype plugin indent on

set tabstop=4
set shiftwidth=4
set expandtab

filetype on
syntax  enable
set ignorecase
set smartcase
set hlsearch
set modelines=0
set wildmode=longest:full
set nu "line numbers

"for indenting
vmap <Tab> >gv
vmap <S-Tab> <gv
inoremap <S-Tab> <C-D>
set lbr "word wrap
set tw=500
set wrap "Wrap lines
" scrolling
set scrolloff=3 " keep three lines between the cursor and the edge of the screen

vnoremap <C-c> "*y
let g:NERDTreeMouseMode = 2

execute pathogen#infect()
