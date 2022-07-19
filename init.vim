call plug#begin()
    Plug 'morhetz/gruvbox' " nvim theme
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " syntax highlighting
    Plug 'rmagatti/auto-session' " auto-session
    Plug 'vim-airline/vim-airline' " buffer and status bar
    Plug 'neoclide/coc.nvim', {'branch': 'release'} " neovim client
    Plug 'preservim/nerdcommenter' " commenter
    Plug 'preservim/nerdtree' " file tree
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " syntax highlighting
    Plug 'Xuyuanp/nerdtree-git-plugin' " git integration
    Plug 'tpope/vim-fugitive' " git integration
    Plug 'ryanoasis/vim-devicons' " icons for file types
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
    Plug 'posva/vim-vue' " vue language pack
    Plug 'mattn/emmet-vim' " emmet support
    Plug 'prettier/vim-prettier' " prettier support
    Plug 'ap/vim-css-color' " css color support
    Plug 'jiangmiao/auto-pairs' " auto-pairing
    Plug 'tpope/vim-surround' " change pair characters
    Plug 'AndrewRadev/tagalong.vim' " tag support
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
set scrolloff=8                       " minimum scroll offset
set signcolumn=yes:2                  " don't split windows
set autoread                          " auto read files
set updatetime=100                    " update time
set sessionoptions+=winpos,terminal   " auto-session

filetype plugin on

let mapleader = " "

nnoremap <Esc> :noh<CR><CR>
nnoremap <ESC> :nohlsearch<CR>

nnoremap <silent><tab> :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap <silent><s-tab> :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

nnoremap <silent><C-p> :GFiles<CR>

nnoremap <leader>yf :let @+=expand("%:p")<CR> " Copy file path to clipboard
nnoremap <leader>yd :let @+=expand("%:p:h")<CR> " Copy directory path to clipboard

nnoremap <leader>wa <C-w>h
nnoremap <leader>ws <C-w>j
nnoremap <leader>ww <C-w>k
nnoremap <leader>wd <C-w>l
nnoremap <leader>wq <C-w>c
nnoremap <leader>we :vsplit<CR>

nnoremap <leader>qq :bd!<cr>
nnoremap <leader>qw :w\|bd<cr>

nnoremap <leader>ff :CtrlSF 
nnoremap <leader>fr :CtrlSFToggle<cr>

nnoremap <leader>gg :G<cr>
nnoremap <leader>gh :Gclog<cr>
nnoremap <leader>gc :Git commit<cr>
nnoremap <leader>gf :Gdiff<cr>
nnoremap <leader>gd :Gvdiffsplit<cr>
nnoremap <leader>gp :G pull<cr>
nnoremap <leader>gP :G push<cr>

nnoremap <leader>dd :call CocAction('jumpDefinition', 'drop')<CR>
nnoremap <leader>ds :call CocAction('jumpDefinition', 'vsplit')<CR>

nnoremap <leader>la :CocAction<cr>
nnoremap <leader>ld :CocDiagnostics<cr>
nnoremap <leader>lt :CocOutline<cr>
nnoremap <leader>ls :CocSearch

nnoremap <leader>bb :NERDTreeToggle<CR>
nnoremap <leader>bf :NERDTreeFind<CR>

nnoremap <leader>cc <Plug>NERDCommenterToggle
vnoremap <leader>cc <Plug>NERDCommenterToggle<CR>gv

nnoremap <leader>pp :Prettier<CR>

nnoremap <C-t> :bel vert term<CR><CR>i
tnoremap <C-t> <CR>exit<CR>

inoremap <silent><expr> <c-space> coc#refresh()

map <F12> :PlugInstall<CR> :PlugUpdate<CR>
map <F10> :PlugClean<CR>

" Auto-session
let g:auto_session_enabled = 1

" Blamer
let g:blamer_enabled = 1
let g:blamer_relative_time = 1
let g:blamer_prefix = '                '

" FZF
let g:fzf_action = { 'ctrl-s': 'split', 'ctrl-v': 'vsplit' }

" CtrlSF
let g:ctrlsf_position = 'right'

" CoC
let g:coc_global_extensions = [
\   'coc-tsserver',
\   'coc-eslint',
\   'coc-vetur',
\   'coc-svelte',
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

" NERDCommenter
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'

" NERDTree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1 " hide helper
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
let g:NERDTreeAutoDeleteBuffer = 1

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

