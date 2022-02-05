call plug#begin()
    Plug 'morhetz/gruvbox' " nvim theme
 
    Plug 'rmagatti/auto-session' " auto-session
    Plug 'vim-airline/vim-airline' " buffer and status bar
    Plug 'neoclide/coc.nvim', {'branch': 'release'} " completion engine
    Plug 'preservim/nerdtree' " file tree
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " syntax highlighting
    Plug 'Xuyuanp/nerdtree-git-plugin' " git integration
    Plug 'tpope/vim-fugitive' " git integration
    Plug 'ryanoasis/vim-devicons' " icons for file types
    Plug 'nvim-lua/plenary.nvim' " lua support
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim' " file finder
    Plug 'dyng/ctrlsf.vim'
    Plug 'lukas-reineke/indent-blankline.nvim' " indent guide
    Plug 'airblade/vim-gitgutter' " git gutter
    Plug 'APZelos/blamer.nvim' " git lens

    Plug 'editorconfig/editorconfig-vim' " editorconfig
    Plug 'github/copilot.vim' " github copilot
    Plug 'vim-test/vim-test' " test runner
    Plug 'sheerun/vim-polyglot' " language pack
    Plug 'mattn/emmet-vim' " emmet support
    Plug 'prettier/vim-prettier' " prettier support
    Plug 'ap/vim-css-color' " css color support
    Plug 'jiangmiao/auto-pairs' " auto-pairing
    Plug 'tpope/vim-surround' " change pair characters
    Plug 'itchyny/vim-cursorword' " highlight current word
    Plug 'terryma/vim-multiple-cursors' " multiple cursors
    Plug 'MattesGroeger/vim-bookmarks' " bookmarks
call plug#end()

syntax on
colorscheme gruvbox

set nocompatible                     " this must be first, because it changes other options as side effect
set termguicolors
set background=dark
set ttyfast
set number
set relativenumber
set mouse=a
set cursorline
set ruler
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
set autoindent
set clipboard=unnamed                 " use native clipboard
set lazyredraw                        " no unneeded redraws
set splitright
set splitbelow
set nobackup                          " don't save backups
set nowritebackup                     " don't save backups
set noswapfile                        " no swapfiles
set noerrorbells                      " no error bells please
set visualbell
set whichwrap=b,s,h,l,<,>,[,]         " backspace and cursor keys wrap too
set scrolloff=4                       " minimum scroll offset
set signcolumn=yes                    " don't split windows
set autoread                          " auto read files
set updatetime=100                    " update time
set sessionoptions+=winpos,terminal   " auto-session

filetype plugin off

" Copy file and directory names to clipboard
nnoremap <silent> yf :let @+=expand("%:p")<CR> " Copy file path to clipboard
nnoremap <silent> yd :let @+=expand("%:p:h")<CR> " Copy directory path to clipboard

nnoremap <silent> gt :bn<CR> " Go to next buffer
nnoremap <silent> gr :bp<CR> " Go to previous buffer

nnoremap <leader>ww :w<cr>
nnoremap <leader>qq :bd!<cr>
nnoremap <leader>wq :w\|bd<cr>

nnoremap <leader>ss :vsplit<cr>
nnoremap <leader>sh :split<cr>

nnoremap <leader>ff :CtrlSF 
nnoremap <leader>fr :CtrlSFToggle<cr>

nnoremap <leader>gg :G<cr>
nnoremap <leader>gh :Gclog<cr>
nnoremap <leader>gc :Git commit<cr>
nnoremap <leader>gf :Gdiff<cr>
nnoremap <leader>gd :Gvdiffsplit<cr>

nnoremap <leader>la :CocAction<cr>
nnoremap <leader>ld :CocDiagnostics<cr>
nnoremap <leader>lt :CocOutline<cr>
nnoremap <leader>ls :CocSearch

map <F12> :PlugInstall<cr>
map <F11> :PlugUpdate<cr>
map <F10> :PlugClean<cr>

" Auto-session
let g:auto_session_enabled = 1

" Blamer
let g:blamer_enabled = 1
let g:blamer_relative_time = 1
let g:blamer_prefix = '                '

" FZF
nnoremap <C-p> :GFiles<CR>
let g:fzf_action = { 'ctrl-s': 'split', 'ctrl-v': 'vsplit' }

" Prettier
nnoremap <leader>pp :Prettier<cr>

" CoC
let g:coc_global_extensions = [
\   'coc-tsserver',
\   'coc-eslint',
\   'coc-vetur',
\   'coc-html',
\   'coc-json',
\   'coc-css',
\   'coc-yaml',
\   'coc-prettier',
\]

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#branch#enabled = 1

" NERDTree
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
nnoremap nb :NERDTreeToggle<cr>
nnoremap nf :NERDTreeFind<cr>

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1 " hide helper
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1

" NERDTree Git Plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
\   'Modified'  : '✹',
\   'Staged'    : '✚',
\   'Untracked' : '✭',
\   'Renamed'   : '➜',
\   'Unmerged'  : '═',
\   'Deleted'   : '✖',
\   'Dirty'     : '✗',
\   'Clean'     : '✔︎',
\   'Ignored'   : '☒',
\   'Unknown'   : '?'
\}

