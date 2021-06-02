" personal vimrc
" default is in /usr/share/
set nocompatible    " needed for many vim things to work

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'folke/lsp-colors.nvim'

" color plugins
Plug 'morhetz/gruvbox'
Plug 'sainnhe/sonokai'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'joshdick/onedark.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'mhartington/oceanic-next'
Plug 'connorholyday/vim-snazzy'
Plug 'wojciechkepka/vim-github-dark'
Plug 'folke/tokyonight.nvim'

" Initialize plugin system
call plug#end()
"
" Update swap files
set directory^=$HOME/.vim/tmp//

" Set nvim python virtual env path
let g:python3_host_prog = '/Users/moja/.virtualenvs/nvim/bin/python3.9'

" Enable mouse scrolling - otherwise tmux scrolls past
set mouse=a

" Syntax highlighting + line numbers
syntax enable		"enable syntax highlighting
set number		"add line numbers
set relativenumber		"add relative line numbers

" Color scheme options
" set termguicolors - for tmux compatibility
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" lightline config
" moved before colorscheme selection to get it working
let g:lightline = {
      \ 'colorscheme': 'tokyonight',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

"""""" aldmeris options """"""
" Does not work in nvim
" let g:aldmeris_transparent = 1	"for aldmeris use in transparent term
" colorscheme aldmeris	"set the colorscheme

"""""" dracula options """"""
" not working in iterm w/ or w/o tmux
" colorscheme dracula

"""""" gruvbox options """"""
" set background=dark
" let g:gruvbox_contrast_dark = 'hard'
" colorscheme gruvbox

"""""" onedark options """"""
" let g:onedark_terminal_italics = 1
" colorscheme onedark

"""""" snazzy options """"""
" let g:SnazzyTransparent = 1
" colorscheme snazzy

"""""" sonokai  options """"""
" more info: `:help sonokai.txt
" seems to not work entirely right at the moment - investigate more
" italics working now, but style options not working
" let g:sonokai_style = 'andromeda' " options: atlantis, andromeda, shusia, maia
" let g:sonokai_enable_italic = 1
" let g:sonokai_disable_italic_comment = 1
" colorscheme sonokai

"""""" tokyonight  options """"""
colorscheme tokyonight

" Search options etc
set showmatch		"highlight matching [{()}]
set hlsearch		"highlight searches
set incsearch		"incremental search highlighting to search once you start typing
set ignorecase      "needed for smartcase to work 
set smartcase       " 
set laststatus=2    " to display lightline
set noshowmode      " -- INSERT -- is duplicated with lightline

" Google Java Style Guide Line Ruler
set colorcolumn=100
" for onedark
" highlight ColorColumn ctermbg=16 " guibg=grey
" for tokyonight
highlight ColorColumn ctermbg=16  guibg=#202434

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Similar to the above but for faster status line mode updates
set ttimeoutlen=50

" open splits below rather than above current window
" and open vsplits to the right
set splitbelow
set splitright

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
" moving the actual split windows themselves
nnoremap <leader>H :wincmd H<CR>
nnoremap <leader>J :wincmd J<CR>
nnoremap <leader>K :wincmd K<CR>
nnoremap <leader>L :wincmd L<CR>
" moving visually selected text
xnoremap <leader>k :move '<-2<CR>gv-gv
xnoremap <leader>j :move '>+1<CR>gv-gv

" FZF settings
nnoremap <silent> <C-P> :Files<CR>
nnoremap <silent> <leader>f :Rg<CR>

" Clear search highlighting
nnoremap <leader>n :noh<CR>

" Below taken from: https://shapeshed.com/vim-netrw/
" Netrw maps
let g:netrw_banner = 0          " removes help banner
let g:netrw_liststyle = 3       " style for list
let g:netrw_browse_split = 0    " opens in previous window (to the left)
let g:netrw_altv = 1            " 
let g:netrw_winsize = 25        " sets size of netrw

" Autocompletion settings
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

let g:completion_matching_strategy_list=['exact', 'substring', 'fuzzy']
let g:completion_trigger_on_delete = 1  " allows completion after you delete characters

" Python Language Server
lua << EOF
require'lspconfig'.pyls_ms.setup{
    on_attach=require'completion'.on_attach;

    cmd = { "dotnet", "exec", "/Users/moja/python-language-server/output/bin/Debug/Microsoft.Python.languageServer.dll" };

    init_options = {
        interpreter = {
            properties = {
                InterpreterPath = "/Users/moja/.virtualenvs/nvim/bin/python3.9",
                version = "3.9.2"
            }
        }
    };
}
EOF

" Vim-Script Language Server
lua << EOF
require'lspconfig'.vimls.setup{
    on_attach=require'completion'.on_attach;
}
EOF

" TreeSitter config
lua <<EOF
require'nvim-treesitter.configs'.setup {
  --ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  --ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true              -- false will disable the whole extension
    --disable = { "c", "rust" },  -- list of language that will be disabled
  },
}
EOF
