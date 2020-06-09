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
