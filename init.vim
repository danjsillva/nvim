" Close window if NERDTree is the last one
"autocmd BufEnter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif

call plug#begin()
    Plug 'sainnhe/sonokai' " nvim theme
    Plug 'joshdick/onedark.vim' " nvim theme
    Plug 'morhetz/gruvbox' " nvim theme
 
    Plug 'rmagatti/auto-session' " auto-session
    Plug 'vim-airline/vim-airline' " buffer and status bar
    Plug 'ludovicchabant/vim-gutentags' " auto tags
    Plug 'majutsushi/tagbar' " tagbar
    Plug 'neoclide/coc.nvim', {'branch': 'release'} " completion engine
    Plug 'preservim/nerdtree' " file tree
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " syntax highlighting
    Plug 'Xuyuanp/nerdtree-git-plugin' " git integration
    Plug 'tpope/vim-fugitive' " git integration
    Plug 'ryanoasis/vim-devicons' " icons for file types
    Plug 'nvim-lua/plenary.nvim' " lua support
    Plug 'nvim-telescope/telescope.nvim' " file explorer
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim' " file finder
    Plug 'lukas-reineke/indent-blankline.nvim' " indent guide
    Plug 'airblade/vim-gitgutter' " git gutter
    Plug 'APZelos/blamer.nvim' " git lens

    Plug 'editorconfig/editorconfig-vim' " editorconfig
    Plug 'github/copilot.vim' " github copilot
    Plug 'vim-test/vim-test' " test runner
    Plug 'sheerun/vim-polyglot' " language pack
    Plug 'mattn/emmet-vim' " emmet support
    Plug 'dense-analysis/ale' "lint engine
    Plug 'prettier/vim-prettier' " prettier support
    Plug 'ap/vim-css-color' " css color support
    Plug 'jiangmiao/auto-pairs' " auto-pairing
    Plug 'tpope/vim-surround' " change pair characters
    Plug 'itchyny/vim-cursorword' " highlight current word
    Plug 'terryma/vim-multiple-cursors' " multiple cursors
    Plug 'MattesGroeger/vim-bookmarks' " bookmarks
call plug#end()

colorscheme gruvbox
syntax on

set nocompatible                     " this must be first, because it changes other options as side effect
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
set tags=./tags,tags;$HOME
set statusline+=%{gutentags#statusline()}

" Copy file and directory names to clipboard
nnoremap <silent> yf :let @+=expand("%:p")<CR> " Copy file path to clipboard
nnoremap <silent> yd :let @+=expand("%:p:h")<CR> " Copy directory path to clipboard

nnoremap <silent> gt :bn<CR> " Go to next buffer
nnoremap <silent> gr :bp<CR> " Go to previous buffer

nnoremap <silent> nt :TagbarToggle<CR> " Go to previous buffer

nnoremap <leader>ww :w<cr>
nnoremap <leader>qq :bd!<cr>
nnoremap <leader>wq :w\|bd<cr>

nnoremap <leader>ss :vsplit<cr>
nnoremap <leader>sh :split<cr>

nnoremap <leader>fp <cmd>Telescope git_files<cr>
nnoremap <leader>ff <cmd>Telescope live_grep<cr>
nnoremap <leader>fh <cmd>Telescope git_bcommits<cr>

nnoremap <leader>gg :G<cr>
nnoremap <leader>gh :Gclog<cr>
nnoremap <leader>gc :Git commit<cr>
nnoremap <leader>gf :Gdiff<cr>
nnoremap <leader>gd :Gvdiffsplit<cr>

" Auto-session
let g:auto_session_enabled = 1

" Blamer
let g:blamer_enabled = 1
let g:blamer_relative_time = 1
let g:blamer_prefix = '                '

" FZF
nnoremap <C-p> :GFiles<CR>
let g:fzf_action = { 'ctrl-s': 'split', 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'down': '40%' }

" Prettier
nnoremap <leader>pp :Prettier<cr>

" Ale
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_linters_explicit = 1
let g:ale_linters = {
\   'typescript': ['eslint', 'tsserver', 'typecheck'],
\   'typescriptreact': ['eslint', 'tsserver', 'typecheck'],
\}
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\   'typescriptreact': ['prettier', 'eslint'],
\}

" CoC
let g:coc_global_extensions = [
 \  'coc-tsserver',
 \  'coc-eslint',
 \  'coc-vetur',
 \  'coc-html',
 \  'coc-json',
 \  'coc-css',
 \  'coc-yaml',
 \  'coc-prettier',
 \  'coc-highlight',
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

" Gutentags
let g:gutentags_ctags_exclude = [
\   '*.git',
\   '*.json',
\   '*.css', '*.less', '*.scss',
\   '*.min.*', '*.map',
\   '*.tmp', '*.cache',
\   '*.svg', '*.gif', '*.ico', '*.jpg', '*.png',
\   '*.md',
\   'node_modules',
\   'build', 'dist', 'bin', 'bundle', 'cache', 'vendor',
\   'docs', 'example',
\   'tags*',
\]
