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
Plug 'kien/rainbow_parentheses.vim' " parentheses
Plug 'guns/vim-clojure-highlight' " Clojure
Plug 'tpope/vim-fireplace' " Clojure
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
Plug 'mhinz/vim-startify'
Plug 'airblade/vim-gitgutter' " git
Plug 'mxw/vim-jsx' " jsx syntax highlight
Plug 'pangloss/vim-javascript' " javascript
Plug '/usr/local/opt/fzf' " fzf
Plug 'tarekbecker/vim-yaml-formatter' " yaml formatting
Plug 'HerringtonDarkholme/yats.vim' " typescript
Plug 'aklt/plantuml-syntax' " PlatnUML syntax highlight
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}  " Python syntax highlight
call plug#end()

" Common
syntax on
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

nnoremap <C-c><C-c> :noh<cr>
nnoremap <leader>/ :FlyGrep<cr>

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
nnoremap <leader>E :Ex<cr>


" Python config
let g:python_highlight_all = 1

" Haskell config
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" Markdown config
let g:vim_markdown_folding_disabled = 1

let g:tex_conceal = ""
let g:indentLine_conceallevel = 0

" gitgutter config
let bg = synIDattr(hlID("Normal"), "bg")
highlight clear SignColumn
highlight GitGutterAdd ctermbg=bg
highlight GitGutterChange ctermbg=bg
highlight GitGutterDelete ctermbg=bg
highlight GitGutterChangeDelete ctermbg=bg

nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)

" fzf config
nmap <leader>, :FZF<cr>

" tab size settings
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab " formating for yaml files
autocmd FileType vue setlocal ts=2 sts=2 sw=2 expandtab " formating for vue files
autocmd FileType ts setlocal ts=2 sts=2 sw=2 expandtab " formating for ts files
autocmd FileType js setlocal ts=2 sts=2 sw=2 expandtab " formating for js files
autocmd FileType sass setlocal ts=2 sts=2 sw=2 expandtab " formating for sass files

" in popup menu remap C-n / C-p -> C-j / C-k
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" clojure
autocmd VimEnter *       RainbowParenthesesToggle
autocmd Syntax   clojure RainbowParenthesesLoadRound
autocmd Syntax   clojure RainbowParenthesesLoadSquare
autocmd Syntax   clojure RainbowParenthesesLoadBraces
nnoremap <leader>e :Eval<cr>
nnoremap <leader>r :Require<cr>
