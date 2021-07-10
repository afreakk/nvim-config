" Bootstrap Plug ----------- {{{{
let autoload_plug_path = stdpath('data') . '/site/autoload/plug.vim'
if !filereadable(autoload_plug_path)
  silent execute '!curl -fLo ' . autoload_plug_path . '  --create-dirs 
      \ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
unlet autoload_plug_path
" }}}}

set inccommand=split

" coc_global_extensions -------- {{{{
let g:coc_global_extensions = [
\    "coc-explorer",
\    "coc-clangd",
\    "coc-css",
\    "coc-eslint",
\    "coc-fsharp",
\    "coc-json",
\    "coc-docker",
\    "coc-yaml",
\    "coc-phpls",
\    "coc-prettier",
\    "coc-diagnostic",
\    "coc-python",
\    "coc-rls",
\    "coc-tsserver",
\    "coc-vimlsp",
\    "coc-comrade",
\ ]
" coc-omnisharp
" }}}}

" set variables -------- {{{{

set hidden

" https://github.com/svermeulen/vim-easyclip#clipboard-setting
set clipboard+=unnamedplus
set cursorline

set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set background=dark
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

set signcolumn=number

" }}}}

" TabMessage -------- {{{{
function! TabMessage(cmd)
  redir => message
  silent execute a:cmd
  redir END
  if empty(message)
    echoerr "no output"
  else
    " use "new" instead of "tabnew" below if you prefer split windows instead of tabs
    tabnew
    setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
    silent put=message
  endif
endfunction
command! -nargs=+ -complete=command TabMessage call TabMessage(<q-args>)
" }}}}

" Plugins -------- {{{{
call plug#begin()
Plug 'svermeulen/vim-subversive'
Plug 'kevinhwang91/nvim-bqf'
Plug 'rmagatti/auto-session'
Plug 'cappyzawa/starlark.vim'
" Plug 'tversteeg/registers.nvim', { 'branch': 'main' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'p00f/nvim-ts-rainbow'
Plug 'LnL7/vim-nix'
Plug 'airblade/vim-gitgutter'
Plug 'freitass/todo.txt-vim'
Plug 'bronson/vim-visual-star-search'
Plug 'rbgrouleff/bclose.vim'
Plug 'pechorin/any-jump.vim'
" Plug 'AlphaMycelium/pathfinder.vim'
" Plug 'svermeulen/vim-easyclip'
Plug 'wellle/targets.vim'
Plug 'andymass/vim-matchup'
Plug 'tpope/vim-unimpaired'
Plug 'chrisbra/Recover.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  }
" Plug 'vim-vdebug/vdebug'
Plug 'mfussenegger/nvim-dap'
Plug 'rbong/vim-flog'
" Plug 'meck/vim-brittany'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
" Plug 'mboughaba/i3config.vim'
" Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'norcalli/nvim-colorizer.lua'
" Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release', 'do': { -> coc#util#install() }}
" Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'laher/fuzzymenu.vim'
Plug 'tpope/vim-fugitive'
" Plug 'itchyny/lightline.vim'
Plug 'hoob3rt/lualine.nvim'
" Plug 'sheerun/vim-polyglot'
" Plug 'morhetz/gruvbox'

Plug 'rktjmp/lush.nvim'
Plug 'npxbr/gruvbox.nvim'

Plug 'tpope/vim-sleuth'
Plug 't9md/vim-choosewin'
Plug 'tpope/vim-rhubarb'
Plug 'folke/which-key.nvim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-dadbod'
Plug 'machakann/vim-highlightedyank'
Plug 'michaeljsmith/vim-indent-object'
Plug 'beeender/Comrade'

"required by nvim-reload
Plug 'nvim-lua/plenary.nvim'
Plug 'famiu/nvim-reload'
call plug#end()
" }}}}

source ~/.config/nvim/guioptions.vim
source ~/.config/nvim/coc.vim
" source ~/.config/nvim/lightline.vim
source ~/.config/nvim/fzf.vim
source ~/.config/nvim/query.vim
source ~/.config/nvim/keymaps.vim
source ~/.config/nvim/languages_autocmd.vim

lua <<EOF
require('colorizer').setup()
require('afreak.treesitter-settings')
require('afreak.dap-settings')
require('afreak.space-maps')
require('afreak.helper-functions')
if cmdAndGetFirstLine("hostname") == "hanstop" then
  vim.api.nvim_set_option("background", "light")
end

vim.g.gruvbox_contrast_dark="hard"
vim.g.highlightedyank_highlight_duration = 350
vim.g.choosewin_label = 'ARSTDHNEIOQWFPGJLUYZXCVBKM'
vim.g.any_jump_disable_default_keybindings = 1
vim.cmd("colorscheme gruvbox")
vim.g.vimsyn_embed = 'l'
require('lualine').setup({
  options = {theme = 'gruvbox'},
  sections = {
    lualine_a = {'coc#status', 'mode'}
  }
})

EOF
