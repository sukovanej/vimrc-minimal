" TextEdit might fail if hidden is not set.
set hidden
" set term=screen-256color

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

set encoding=UTF-8
set termguicolors
set mouse=a
set clipboard=unnamedplus
set number
set relativenumber
let mapleader = ','
let maplocalleader=","
set nocompatible

set smartcase

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

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

call plug#begin('~/.vim/plugged')

" Prisma syntax hightlighting
Plug 'pantharshit00/vim-prisma'

" Haskell
Plug 'pbrisbin/vim-syntax-shakespeare'

" Git
" Plug 'tpope/vim-fugitive'

" tmux navigation
Plug 'christoomey/vim-tmux-navigator'

" vim-surround + repeat
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" rainbow parentheses
Plug 'luochen1990/rainbow'

" clojure
Plug 'Olical/conjure'  " conjure
Plug 'guns/vim-sexp'  " something like paredit
Plug 'tpope/vim-sexp-mappings-for-regular-people'  " syrup

" search
Plug 'mileszs/ack.vim'

" parentheses
Plug 'kien/rainbow_parentheses.vim'

" Theme
Plug 'bluz71/vim-nightfly-guicolors'

" Terraform plugin
Plug 'hashivim/vim-terraform' 

" Git
Plug 'airblade/vim-gitgutter' " git

" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Python
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}  " Python syntax highlight

" airline
Plug 'vim-airline/vim-airline' " airline
Plug 'vim-airline/vim-airline-themes' " airline

" Fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Syntax highlight
Plug 'sheerun/vim-polyglot'

" Icons
Plug 'ryanoasis/vim-devicons'

call plug#end()

" Ack - use ag is installed
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" go to definition
nmap <silent> gd <Plug>(coc-definition)

" find references
nmap <silent> gr <Plug>(coc-references)

" List problems
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>

" Remap keys for applying codeAction to the current line.
nmap <space>ac <Plug>(coc-codeaction)

" Apply AutoFix to problem on the current line.
nmap <space>qf <Plug>(coc-fix-current)

" Highlight on hover
autocmd CursorHold * silent call CocActionAsync('highlight')

" Format
nnoremap <space>f :call CocAction('format')<cr>

" navigate pop up with <C-j> and <C-k>
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Fzf
nnoremap <space><space> :FZF<cr>
nnoremap <space>a :Ag<cr>
nnoremap <space>b :Buffers<cr>

" Shut off completion messages
set shortmess+=c

" Airline
set t_Co=256
let g:airline_powerline_fonts = 1
let g:airline_theme='nightfly'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Common
syntax on
colorscheme nightfly
nnoremap <C-c><C-c> :noh<cr>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
command W w
nnoremap <BS> <C-w>h  " https://github.com/neovim/neovim/issues/2048#issuecomment-77159983
nnoremap <C-h> <C-w>h

" Delete current buffer
nnoremap gc :bdelete<cr>

" Delete all buffers but the current
command! BufOnly execute '%bdelete|edit #|normal `"'
nnoremap gC :BufOnly<cr>

" Next buffer
nnoremap gn :bn<cr>

" Previous buffer
nnoremap gN :bp<cr>

" Python config
let g:python_highlight_all = 1
autocmd FileType python nnoremap <leader>p :Pytest file verbose<cr>
autocmd FileType python nnoremap <leader>i :CocCommand pyright.organizeimports<cr>
autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab " formating for html files

" Markdown config
let g:vim_markdown_folding_disabled = 1
let g:tex_conceal = ""
let g:indentLine_conceallevel = 0

" yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab " formating for yaml files

" typescript + javascript
au BufNewFile,BufRead *.scss setlocal filetype=sass
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
au BufNewFile,BufRead .babelrc setlocal filetype=json
au BufNewFile,BufRead .eslintrc setlocal filetype=json

autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab " formating for ts files
autocmd FileType typescript setlocal ts=2 sts=2 sw=2 expandtab " formating for ts files
autocmd FileType typescript.tsx setlocal ts=2 sts=2 sw=2 expandtab " formating for ts files
autocmd FileType vue setlocal ts=2 sts=2 sw=2 expandtab " formating for vue files
autocmd FileType sass setlocal ts=2 sts=2 sw=2 expandtab " formating for sass files
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab " formating for html files
let g:yats_host_keyword = 1

" rainbow parentheses
let g:rainbow_active = 1

" Haskell
au BufNewFile,BufRead *.hs setlocal filetype=haskell

" Terminal
tnoremap <Esc> <C-\><C-n>

" Tmux conf
au BufNewFile,BufRead *.conf.local setlocal filetype=conf

" TMP: husk development
au BufNewFile,BufRead *.hu setlocal filetype=lisp
