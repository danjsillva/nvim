call plug#begin()
    " General
    Plug 'rmagatti/auto-session'       " auto-session
    Plug 'editorconfig/editorconfig-vim' " editorconfig

    " Graphical
    Plug 'morhetz/gruvbox'             " nvim theme
    Plug 'lukas-reineke/indent-blankline.nvim' " indent guide
    Plug 'ryanoasis/vim-devicons'      " icons for file types
    Plug 'vim-airline/vim-airline'     " buffer and status bar
    Plug 'preservim/nerdtree'          " file tree
    Plug 'Xuyuanp/nerdtree-git-plugin' " git integration
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " syntax highlighting
    Plug 'nvim-lua/plenary.nvim'       " lua plugin
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fuzzy finder
    Plug 'junegunn/fzf.vim'            " fuzzy finder
    Plug 'dyng/ctrlsf.vim'             " grep finder

    " Language
    Plug 'neoclide/coc.nvim', {'branch': 'release'} " neovim client
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " syntax highlighting
    Plug 'sheerun/vim-polyglot'        " language pack
    Plug 'mattn/emmet-vim'             " emmet support
    Plug 'posva/vim-vue'               " vue language pack
    Plug 'prettier/vim-prettier'       " prettier support
    Plug 'ap/vim-css-color'            " css color support

    " Tools
    Plug 'MattesGroeger/vim-bookmarks' " bookmarks
    Plug 'vim-test/vim-test'           " test runner
    Plug 'preservim/nerdcommenter'     " commenter
    Plug 'itchyny/vim-cursorword'      " highlight current word
    Plug 'tpope/vim-surround'          " change pair characters
    Plug 'jiangmiao/auto-pairs'        " auto-pairing
    Plug 'AndrewRadev/tagalong.vim'    " tag support
    Plug 'mg979/vim-visual-multi', {'branch': 'master'} " multiple cursor

    " Git support
    Plug 'tpope/vim-fugitive'          " git integration
    Plug 'airblade/vim-gitgutter'      " git signs
    Plug 'APZelos/blamer.nvim'         " git lens
call plug#end()

syntax on
colorscheme gruvbox

set nocompatible                       " this must be first, because it changes other options as side effect
set lazyredraw
set ttyfast
set mouse=a
set clipboard=unnamed                  " use native clipboard

set termguicolors
set background=dark
set number
set relativenumber
set signcolumn=yes:2
set scrolloff=8
set cursorline

set splitright
set splitbelow
set whichwrap=b,s,h,l,<,>,[,]          " backspace and cursor keys wrap too

set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

filetype plugin on

let mapleader = " "

nnoremap <Esc> :noh<CR><CR>
nnoremap <Esc> :nohlsearch<CR>

nnoremap <silent><tab> :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap <silent><s-tab> :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

vnoremap < <gv
vnoremap > >gv

nnoremap <silent><C-p> :Files<CR>

nnoremap <leader>yf :let @+=expand("%:p")<CR> " Copy file path to clipboard
nnoremap <leader>yd :let @+=expand("%:p:h")<CR> " Copy directory path to clipboard

nnoremap <leader>rr :%s///g<Left><Left>
nnoremap <leader>rc :%s///gc<Left><Left><Left>

vnoremap * y/\V<C-R>=escape(@",'/\')<CR><CR>

nnoremap <leader>wq <C-w>c
nnoremap <leader>ww <C-w>w
nnoremap <leader>we :vsplit<CR>

nnoremap <leader>qq :bd!<cr>
nnoremap <leader>qw :w\|bd<cr>

nnoremap <leader>ff :CtrlSF 
vnoremap <leader>ff y:CtrlSF <C-R>+<cr>
nnoremap <leader>fe vawy:CtrlSF <C-R>+<cr>
nnoremap <leader>fr :CtrlSFToggle<cr>

nnoremap <leader>fg :BLines<cr>

nnoremap <leader>pp :GFiles<cr>
nnoremap <leader>po :History<cr>

nnoremap <leader>gg :G<cr>
nnoremap <leader>gc :Git commit<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gp :G pull<cr>
nnoremap <leader>gP :G push origin HEAD<cr>

nnoremap <leader>gh :Commits<cr>
nnoremap <leader>gf :BCommits<cr>

nnoremap <leader>dd :call CocAction('jumpDefinition', 'drop')<CR>
nnoremap <leader>ds :call CocAction('jumpDefinition', 'vsplit')<CR>
nnoremap <leader>dw :call CocAction('doHover')<CR>

nnoremap <leader>la :CocAction<cr>
nnoremap <leader>ld :CocDiagnostics<cr>
nnoremap <leader>lt :CocOutline<cr>
nnoremap <leader>ls :CocSearch
nnoremap <leader>lp :Prettier<CR>

nnoremap <leader>bb :NERDTreeToggle<CR>
nnoremap <leader>bf :NERDTreeFind<CR>

nnoremap <leader>cc <Plug>NERDCommenterToggle
vnoremap <leader>cc <Plug>NERDCommenterToggle<CR>gv

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
let g:fzf_layout = { 'down': '~50%' }

" CtrlSF
let g:ctrlsf_backend = 'ack'
let g:ctrlsf_auto_focus = { "at":"start" }
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
\   'coc-tabnine'
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
let g:NERDTreeShowBookmarks = 1
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

