set clipboard=unnamed
set number
set relativenumber

syntax on
colorscheme focuspoint

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab 
set nowrap
set scrolloff=10 " Gap from the top/bottom when scrolling
set splitbelow " Natural split
set splitright " Natural split
set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')
Plug 'vim-python/python-syntax'
Plug 'elixir-editors/vim-elixir'
Plug 'fatih/vim-go'
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

nnoremap <C-c><C-c> :noh<cr>

let g:python_highlight_all = 1

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap gc :bdelete<cr>
nnoremap gn :bn<cr>
nnoremap gN :bp<cr>

" Haskell config
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
