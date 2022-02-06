set inccommand=split
set hidden
" https://github.com/svermeulen/vim-easyclip#clipboard-setting
set clipboard+=unnamedplus
set cursorline
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set backupcopy=yes " for REACT etc tranzpilers
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
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set ruler               " Show the line and column numbers of the cursor.
set number              " Show the line numbers on the left side.
set relativenumber
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set noshowmode

" https://www.reddit.com/r/vim/wiki/tabstop
set tabstop=8 softtabstop=4 shiftwidth=4 expandtab

set modeline            " Enable modeline.

set timeout ttimeoutlen=50
"for which_key to act faster, hopefully im faster than 500 doing combokeys
set timeoutlen=500
set t_Co=256                         " Enable 256 colors
set termguicolors

"https://github.com/neoclide/coc.nvim/wiki/F.A.Q#linting-is-slow
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" Better display for messages
set cmdheight=2

" don't give |ins-completion-menu| messages.
set shortmess+=c

" set signcolumn="auto"

set shell=/usr/bin/env\ bash

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
augroup END

autocmd VimResized * wincmd =

lua << EOF
require("afreak.packer-bootstrap")
require("afreak.packer")
EOF
