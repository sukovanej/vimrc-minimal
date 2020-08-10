set clipboard=unnamed
set number
set relativenumber
let mapleader = ','
let maplocalleader=","
set nocompatible

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
set foldnestmax=2

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')
Plug 'kien/rainbow_parentheses.vim' " parentheses
Plug 'guns/vim-clojure-highlight' " Clojure
Plug 'tpope/vim-fireplace' " Clojure
Plug 'elixir-editors/vim-elixir' " Elixir
Plug 'fatih/vim-go' " Go
Plug 'christoomey/vim-tmux-navigator' " Tmux
Plug 'wsdjeg/FlyGrep.vim' " project wide search
Plug 'octol/vim-cpp-enhanced-highlight' " c++
Plug 'Yggdroot/indentLine' " show indent line
Plug 'morhetz/gruvbox' " Theme
Plug 'hashivim/vim-terraform' " Terraform plugin
Plug 'isobit/vim-caddyfile' " caddy support
Plug 'plasticboy/vim-markdown' " markdown
Plug 'airblade/vim-gitgutter' " git
Plug '/usr/local/opt/fzf' " fzf
Plug 'tarekbecker/vim-yaml-formatter' " yaml formatting
Plug 'aklt/plantuml-syntax' " PlatnUML syntax highlight
Plug 'tmhedberg/SimpylFold' " folding

" javascript
Plug 'HerringtonDarkholme/yats.vim' " typescript
Plug 'mxw/vim-jsx' " jsx syntax highlight
Plug 'pangloss/vim-javascript' " javascript

" python
Plug 'alfredodeza/pytest.vim'
Plug 'integralist/vim-mypy'  " Python mypy integration
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}  " Python syntax highlight
Plug 'alfredodeza/pytest.vim'
Plug 'fisadev/vim-isort'

" autocomplete
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'ryanolsonx/vim-lsp-python'
Plug 'mattn/vim-lsp-settings'
Plug 'lifepillar/vim-mucomplete'

" org-mode
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'
Plug 'mattn/calendar-vim'

" airline
Plug 'vim-airline/vim-airline' " airline
Plug 'vim-airline/vim-airline-themes' " airline

" html
" Plug 'mattn/emmet-vim'

call plug#end()

"mucomplete
" Mandatory options for plugin to work
set completeopt+=menuone
set completeopt+=noselect
" Shut off completion messages
set shortmess+=c
" prevent a condition where vim lags due to searching include files.
set complete-=i
let g:mucomplete#enable_auto_at_startup = 1

"html
" let g:user_emmet_leader_key=','

" Org mode
let g:org_agenda_files= ["~/org/emacs.org", "~/org/haskell.org", "~/org/kiosk.org", "~/org/rust.org", "~/org/school.org"]

" Airline
set t_Co=256
let g:airline_powerline_fonts = 1
let g:airline_theme='cool'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Autocomplete
nnoremap <leader>d :LspDefinition<CR>
let g:lsp_diagnostics_enabled = 0 " disable LSP diagnostics

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

nnoremap <space> za
vnoremap <space> za

" Python config
let g:python_highlight_all = 1
autocmd FileType python nnoremap <leader>p :Pytest file verbose<cr>
autocmd FileType python nnoremap <leader>i :Isort<cr>
autocmd FileType python nnoremap <leader>b :!black %<cr>

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
nnoremap <C-p> :<C-u>FZF<CR>

" tab size settings
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab " formating for yaml files
autocmd FileType vue setlocal ts=2 sts=2 sw=2 expandtab " formating for vue files
autocmd FileType ts setlocal ts=2 sts=2 sw=2 expandtab " formating for ts files
autocmd FileType js setlocal ts=2 sts=2 sw=2 expandtab " formating for js files
autocmd FileType sass setlocal ts=2 sts=2 sw=2 expandtab " formating for sass files
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab " formating for html files

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

" clang
let g:clang_library_path='/usr/local/opt/llvm/lib'
nnoremap <space> za
autocmd FileType c inoremap <C-space> <C-x><C-u>
set foldmethod=syntax
