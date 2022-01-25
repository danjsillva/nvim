" Aways open NERDTree
" autocmd VimEnter * NERDTree | wincmd p
" Close window if NERDTree is the last one
autocmd BufEnter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif

call plug#begin()
    Plug 'sainnhe/sonokai' " nvim theme
    Plug 'joshdick/onedark.vim' " nvim theme
    
    Plug 'vim-airline/vim-airline' " buffer and status bar
    Plug 'majutsushi/tagbar' " tagbar
    Plug 'preservim/nerdtree' " file tree
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " syntax highlighting
    Plug 'Xuyuanp/nerdtree-git-plugin' " git integration
    Plug 'tpope/vim-fugitive' " git integration
    Plug 'ryanoasis/vim-devicons' " icons for file types
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim' " file finder
    Plug 'lukas-reineke/indent-blankline.nvim' " indent guide
    Plug 'airblade/vim-gitgutter' " git gutter

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

colorscheme sonokai
syntax on

set number
set relativenumber
set mouse=a
set cursorline
set hlsearch
set ignorecase
set showmatch
set clipboard=unnamed                 " use native clipboard
set lazyredraw                        " no unneeded redraws
set nobackup                          " don't save backups
set noswapfile                        " no swapfiles
set noerrorbells                      " no error bells please
set whichwrap=b,s,h,l,<,>,[,]         " backspace and cursor keys wrap too

" FZF
nnoremap <C-p> :GFiles<CR>
let g:fzf_action = {'ctrl-s': 'split', 'ctrl-v': 'vsplit'}

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

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#branch#enabled = 1

" NERDTree
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
nnoremap nt :NERDTreeToggle<cr>
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
