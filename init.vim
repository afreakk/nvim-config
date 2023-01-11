set inccommand=split
set hidden
set cursorline
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set backupcopy=yes " for REACT etc transpilers
set mouse=a
set undofile
" Neovim-qt Guifont command, to change the font
" Set font on start
set autowrite
" You can use \c to force a pattern to be case insensitive, or  \C to force a pattern to be case sensitive.
set ignorecase
set smartcase

"that fancy vim-command tab completion where it shows options at the bottom
set wildmenu
set wildignorecase

set incsearch
set hlsearch
set showcmd               " Show (partial) command in status line.
set showmatch             " Show matching brackets.
set ruler                 " Show the line and column numbers of the cursor.
set number relativenumber " Show the line numbers on the left side.
set formatoptions+=o      " Continue comment marker in new lines.
set textwidth=0           " Hard-wrap long lines as you type them.
set noshowmode

" https://www.reddit.com/r/vim/wiki/tabstop
set tabstop=8 softtabstop=4 shiftwidth=4 expandtab

set modeline            " Enable modeline.

set timeout ttimeoutlen=50
set t_Co=256                         " Enable 256 colors
set termguicolors

"coc stuff from https://github.com/neoclide/coc.nvim#example-vim-configuration
"https://github.com/neoclide/coc.nvim/wiki/F.A.Q#linting-is-slow
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup



" Better display for messages
set cmdheight=2

" don't give |ins-completion-menu| messages.
set shortmess+=c

" set signcolumn="auto"

set shell=/usr/bin/env\ fish
set spelllang=nb,en

" move selected text up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Move cursor between windows
nnoremap <C-Up> <C-W>k
nnoremap <C-Down> <C-W>j
nnoremap <C-Left> <C-W>h
nnoremap <C-Right> <C-W>l

"center after scroll is nice
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" make Y more consistent 
nmap Y y$

"terminal mode mappings
tnoremap <C-Up>     <C-\><C-N><C-w>h
tnoremap <C-Down>   <C-\><C-N><C-w>j
tnoremap <C-Left>   <C-\><C-N><C-w>k
tnoremap <C-Right>  <C-\><C-N><C-w>l
tnoremap <Space><Esc>      <C-\><C-n>

let mapleader = ';'
let maplocalleader = '\'
noremap <Leader>y "+y
noremap <Leader>Y "*y
lua require("afreak.lazy")
