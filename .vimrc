set clipboard=unnamed
set number
set relativenumber
let mapleader = ','

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
Plug 'vim-python/python-syntax' " Python
Plug 'elixir-editors/vim-elixir' " Elixir
Plug 'fatih/vim-go' " Go
Plug 'christoomey/vim-tmux-navigator' " Tmux
Plug 'davidhalter/jedi-vim' " python autocompletion
Plug 'wsdjeg/FlyGrep.vim' " project wide search
Plug 'ap/vim-buftabline' " show buffers
Plug 'octol/vim-cpp-enhanced-highlight' " c++
Plug 'Yggdroot/indentLine' " show indent line
Plug 'morhetz/gruvbox' " Theme
Plug 'hashivim/vim-terraform' " Terraform plugin
Plug 'isobit/vim-caddyfile' " caddy support
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Autocomplete
Plug 'mhinz/vim-startify'
Plug 'airblade/vim-gitgutter' " git
call plug#end()

syntax on
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

nnoremap <C-c><C-c> :noh<cr>
nnoremap <leader>/ :FlyGrep<cr>

" Python config
let g:python_highlight_all = 1

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" https://github.com/neovim/neovim/issues/2048#issuecomment-77159983
if has('nvim')
    nnoremap <BS> <C-w>h
else
    nnoremap <C-h> <C-w>h
endif

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

let g:spacevim_debug_level='ERROR'

" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" Markdown config
let g:vim_markdown_folding_disabled = 1

" Deoplete configuration
" let g:deoplete#enable_at_startup = 1
let g:tex_conceal = ""
let g:conceallevel = 0

au BufReadPost *.gisp set syntax=lisp

" gitgutter config
let bg = synIDattr(hlID("Normal"), "bg")
highlight clear SignColumn
highlight GitGutterAdd ctermbg=bg
highlight GitGutterChange ctermbg=bg
highlight GitGutterDelete ctermbg=bg
highlight GitGutterChangeDelete ctermbg=bg
