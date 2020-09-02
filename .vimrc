" personal vimrc
" default is in /usr/share/
syntax enable		"enable syntax highlighting
set number		"add line numbers
set relativenumber		"add relative line numbers
let g:aldmeris_transparent = 1	"for aldmeris use in transparent term
colorscheme aldmeris	"set the colorscheme
set showmatch		"highlight matching [{()}]
set hlsearch		"highlight searches
set incsearch		"incremental search highlighting to search once you start typing
set ignorecase      "needed for smartcase to work 
set smartcase       " 

" Google Java Style Guide Line Ruler
set colorcolumn=100
highlight ColorColumn ctermbg=0 guibg=lightgrey

" tab to space setup
set tabstop=4		" set the size of tabs to 4 spaces
set softtabstop=4		" set the size of tabs to 4 spaces
set shiftwidth=4		" set the size of tabs to 4 spaces
set expandtab		" converts tabs to spaces when saving file
set smartindent

" leader key and remaps
"""""""""""""""""""""""
let mapleader = " "

" moving between splits
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Below taken from: https://shapeshed.com/vim-netrw/
" Netrw maps
let g:netrw_banner = 0          " removes help banner
let g:netrw_liststyle = 3       " style for list
let g:netrw_browse_split = 4    " opens in previous window (to the left)
let g:netrw_altv = 1            " 
let g:netrw_winsize = 30        " sets size of netrw
