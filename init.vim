" Bootstrap Plug ----------- {{{{
let autoload_plug_path = stdpath('data') . '/site/autoload/plug.vim'
if !filereadable(autoload_plug_path)
  silent execute '!curl -fLo ' . autoload_plug_path . '  --create-dirs 
      \ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
unlet autoload_plug_path
" }}}}

" vim / nvim specifics -------- {{{{
if has('nvim')
  set inccommand=split
endif
if !has('nvim')
  set esckeys             " Cursor keys in insert mode.
  " https://github.com/vim/vim/issues/993#issuecomment-255651605
  " let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  " let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

  " https://unix.stackexchange.com/a/1764
  map <ESC>[1;5A <C-Up>
  map <ESC>[1;5B <C-Down>
  map <ESC>[1;5C <C-Right>
  map <ESC>[1;5D <C-Left>
endif
" }}}}

" Cursor appearance t_SI etc -------- {{{{
set guicursor+=a:blinkon333
set guicursor+=a:blinkon0
" hi Cursor guifg=#121212 guibg=#afd700
" let &t_SI = "\<Esc>[5 q"
" let &t_SR = "\<Esc>[4 q"
" let &t_EI = "\<Esc>[2 q"
" }}}}

" GuiOptions -------- {{{{
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set guifont=Hack\ Nerd\ Font\ Mono:h13
if !has('nvim')
  set guiheadroom=0
endif
" }}}}

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

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

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
Plug 'svermeulen/vim-easyclip'
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
Plug 'itchyny/lightline.vim'
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

" Plugin settings (Uncategorized) -------- {{{{
lua require'colorizer'.setup()
let g:gruvbox_contrast_dark="hard"
colorscheme gruvbox
let g:EasyClipUseSubstituteDefaults = 1
let g:highlightedyank_highlight_duration = 350
let g:choosewin_label = 'ARSTDHNEIOQWFPGJLUYZXCVBKM'
let g:any_jump_disable_default_keybindings = 1
" }}}}

lua <<EOF
require('treesitter-settings')
require('dap-settings')
require('space-maps')
EOF
let g:vimsyn_embed = 'l'

source ~/.config/nvim/coc.vim
source ~/.config/nvim/lightline.vim
source ~/.config/nvim/fzf.vim
source ~/.config/nvim/query.vim
source ~/.config/nvim/keymaps.vim


" Javascript my stuff -------- {{{{
augroup filetype_javascript
    autocmd!
    autocmd FileType javascript,javascriptreact :iabbrev <buffer> clg console.log()<left>
    autocmd FileType javascript,javascriptreact :iabbrev <buffer> iff if ()<left>
    autocmd FileType javascript,javascriptreact :iabbrev <buffer> cc const
    autocmd FileType javascript,javascriptreact :iabbrev <buffer> rr return 
    autocmd FileType javascript,javascriptreact setlocal foldmethod=syntax
    autocmd FileType javascript,javascriptreact setlocal foldnestmax=1
    set nofoldenable
augroup END
" }}}}

augroup filetype_gitcommit
    autocmd!
    autocmd FileType gitcommit :iabbrev <buffer> mz modernize
augroup END
" Vimscript file settings -------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

function! QuickfixToggle()
    let t:quickfix_is_open = get(t:, 'quickfix_is_open', 0)
    if t:quickfix_is_open
        cclose
        let t:quickfix_is_open = 0
        execute winnr('#') . "wincmd w"
    else
        copen
        let t:quickfix_is_open = 1
    endif
endfunction

let hostname = substitute(system('hostname'), '\n', '', '')
if hostname == "hanstop"
  set background=light
endif
