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
\    "coc-json",
\    "coc-explorer",
\    "coc-clangd",
\    "coc-css",
\    "coc-eslint",
\    "coc-fsharp",
\    "coc-json",
\    "coc-phpls",
\    "coc-prettier",
\    "coc-diagnostic",
\    "coc-python",
\    "coc-rls",
\    "coc-tsserver",
\    "coc-vimlsp",
\    "coc-omnisharp",
\ ]
" }}}}

" set variables -------- {{{{

set hidden

" https://github.com/svermeulen/vim-easyclip#clipboard-setting
set clipboard+=unnamedplus

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
set t_Co=256                         " Enable 256 colors
set termguicolors

"https://github.com/neoclide/coc.nvim/wiki/F.A.Q#linting-is-slow
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" Better display for messages
set cmdheight=2

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes


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
Plug 'vim-vdebug/vdebug'
Plug 'rbong/vim-flog'
" Plug 'meck/vim-brittany'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'mboughaba/i3config.vim'
Plug 'chrisbra/Colorizer'
" Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release', 'do': { -> coc#util#install() }}
" Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'laher/fuzzymenu.vim'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-sleuth'
Plug 't9md/vim-choosewin'
Plug 'liuchengxu/vim-which-key'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-dadbod'
Plug 'machakann/vim-highlightedyank'
Plug 'michaeljsmith/vim-indent-object'
call plug#end()
" }}}}

" Golang stuff -------- {{{{
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_function_calls = 1
let g:go_metalinter_autosave = 1
let g:go_metalinter_enabled = ['vet', 'errcheck', 'staticcheck']
let g:go_metalinter_autosave_enabled = ['vet', 'errcheck', 'staticcheck']
let g:go_fmt_command = "goimports"
let g:go_def_mapping_enabled = 0
" }}}}

" LightLine -------- {{{{

" Add status line support, for integration with other plugin, checkout `:h coc-status`
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'currentfunction', 'readonly', 'filename', 'modified' ] ],
      \   'right': [['lineinfo'], ['percent'], ['cocstatus']]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }

command! LightlineReload call LightlineReload()

function! LightlineReload()
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction
" }}}}

" Coc -------- {{{{

" from https://github.com/neoclide/coc.nvim#example-vim-configuration

" Use K to show documentation in preview window
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Using CocList
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" }}}}

" Fzf Stuff -------- {{{{
command! -bang -nargs=? GFilesRecursive call fzf#vim#gitfiles("--recurse-submodules", {}, <bang>0)
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction
"This is the default extra key bindings
let g:fzf_action = {
        \ 'ctrl-q': function('s:build_quickfix_list'),
	\ 'ctrl-t': 'tab split',
	\ 'ctrl-x': 'split',
	\ 'ctrl-v': 'vsplit' }

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

command! -bang -nargs=+ -complete=dir Rag call fzf#vim#ag_raw(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], [preview window], [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Bat: https://github.com/sharkdp/bat
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Search multiline
command! -bang -nargs=* Rgm
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case --multiline '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" }}}}

" Window splitting/movement -------- {{{{
nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>

nmap <silent> <S-Up> :wincmd K<CR>
nmap <silent> <S-Down> :wincmd J<CR>
nmap <silent> <S-Left> :wincmd H<CR>
nmap <silent> <S-Right> :wincmd L<CR>
" }}}}

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

" Vimscript file settings -------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Setup Leader/Space/LocalLeader -------- {{{{
let g:leaderMap =  {}
let g:spaceThing = {}
let g:spaceThing.z ={'name': 'Theme menu'} 
let g:spaceThing.y ={'name': 'Copy menu'} 
let g:spaceThing.v ={'name': 'Vimrc menu'} 
let g:spaceThing.c ={'name': 'Commands'} 
call which_key#register('\', "g:leaderMap")
call which_key#register("\<Space>", "g:spaceThing")

let g:maplocalleader = "\<F2>"
let g:mapleader = '\'

nnoremap <silent> <leader>      :<c-u>WhichKey '\'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  '<F2>'<CR>
" }}}}

" Space hotkeys -------- {{{{
nnoremap <silent> <Space> :<c-u>WhichKey  '<Space>'<CR>
nnoremap <Space>w :w<cr>

nmap <Space><Space> <Plug>Fzm
vmap <Space><Space> <Plug>FzmVisual

function! SetTransparentBg()
    hi Normal guibg=NONE ctermbg=NONE
endfunction
nnoremap <Space>yf :%y<CR>
nnoremap <Space>yn :let @+=expand("%")<CR>
nnoremap <Space>zd :set background=dark<CR>
nnoremap <Space>zl :set background=light<CR>
nnoremap <Space>zt :call SetTransparentBg()<CR>

nnoremap <Space>g :GFilesRecursive<cr>
nnoremap <Space>p :Files<cr>
nnoremap <Space>b :Buffers<cr>

nnoremap <Space>n :noh<cr> 
nnoremap <space>; :History:<cr>
nnoremap <space>f :CocCommand explorer<CR>

nnoremap <Space>cx :IPaste<cr>
nnoremap <Space>cl :BLines<cr>
nnoremap <Space>ch :Helptags<cr>
nnoremap <Space>cc :Commands<cr>
nnoremap <Space>cm :Maps<cr>

nnoremap <space>ve :vsplit $MYVIMRC<cr>
nnoremap <space>vs :source $MYVIMRC<cr>

nnoremap <space>t  :vsplit ~/Dropbox/todo/todo.txt<cr>

nnoremap <Space>q :set operatorfunc=<SID>AgTxtObj<cr>g@
vnoremap <Space>q :<c-u>call <SID>AgTxtObj(visualmode())<cr>

nnoremap <Space>q<space> :Ag 

nnoremap <Space>qc :set operatorfunc=<SID>AgTxtObjInCurrentDirectory<cr>g@
vnoremap <Space>qc :<c-u>call <SID>AgTxtObjInCurrentDirectory(visualmode())<cr>

nnoremap <Space>qs :set operatorfunc=<SID>CocSymbolObj<cr>g@
vnoremap <Space>qs :<c-u>call <SID>CocSymbolObj(visualmode())<cr>

nnoremap <Space>qg :set operatorfunc=<SID>GitGrepTextObj<cr>g@
vnoremap <Space>qg :<c-u>call <SID>GitGrepTextObj(visualmode())<cr>
" }}}}

" Leader hotkeys -------- {{{{
let g:leaderMap['g'] = {
                \'name' : 'Git Menu',
                \'s' : ['Gstatus', 'Git Status'],
                \'p' : ['Gpull',   'Git Pull'],
                \'u' : ['Gpush',   'Git Push'],
                \'d' : ['Gdiffsplit', 'Diff split'],
                \'b' : ['Gblame',  'Git blame'],
                \'l' : ['0Glog',  '0Git log'],
                \'o' : ['Glog',  'Git log'],
                \'w' : ['Gbrowse',  'Git browse'],
                \'c' : ['Gbranch',  'Git checkout branch'],
                \}

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

nnoremap <silent> <leader>l  :<C-u>CocList<cr>
" Show all diagnostics
nnoremap <silent> <leader>d  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <leader>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <leader>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <leader>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <leader>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <leader>n  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>p  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <leader>re  :<C-u>CocListResume<CR>
nmap <leader>rn <Plug>(coc-rename)

nnoremap <silent> <leader>u  :<C-u>CocCommand workspace.showOutput<CR>
" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>a  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>x  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <leader>t <Plug>(coc-range-select)
xmap <silent> <leader>t <Plug>(coc-range-select)
xmap <silent> <leader>b <Plug>(coc-range-select-backword)

nnoremap <leader>q :call <SID>QuickfixToggle()<cr>
nnoremap <silent> <leader>m  :<C-u>MarkdownPreview<CR>

" }}}}

" Keymaps -------- {{{{
"Because easyclip uses m for move
nnoremap gm m
" overrides Middle screen hotkey
nmap M <Plug>MoveMotionEndOfLinePlug
tnoremap <S-Esc> <C-\><C-n>
nmap <C-S> <Plug>(choosewin)
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Insert mode completion (FZF)
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gd <Plug>(coc-definition)

" override go to x hotkeys for go files, use vim-go instead of coc-nvim
autocmd FileType go     nnoremap <buffer> gy :GoDefType<CR>
autocmd FileType go     nnoremap <buffer> gr :GoReferrers<CR>
autocmd FileType go     nnoremap <buffer> gd :GoDef<CR>

" If your '{' or '}' are not in the first column, and you would like to use "[["
" and "]]" anyway, try these mappings:

map [[ ?{<CR>w99[{:noh<cr>
map ][ /}<CR>b99]}:noh<cr>
map ]] j0[[%/{<CR>:noh<cr>
map [] k$][%?}<CR>:noh<cr>
" }}}}

" Plugin settings (Uncategorized) -------- {{{{
colorscheme gruvbox

let g:EasyClipUseSubstituteDefaults = 1
let g:highlightedyank_highlight_duration = 350
let g:choosewin_label = 'ARSTDHNEIOQWFPGJLUYZXCVBKM'
" }}}}

" My functions ----------- {{{
function! s:GetTxtObj(type)
    let prev_registered = @@
    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    else
        return
    endif
    let txtObj = @@
    let @@ = prev_registered
    return txtObj
endfunction

function! s:CocSymbolObj(type)
  execute 'CocList -I --normal --input='.s:GetTxtObj(a:type).' symbols'
endfunction

function! s:GitGrepTextObj(type)
    execute "GGrep ".s:GetTxtObj(a:type)
endfunction

function! s:AgTxtObj(type)
    execute "Ag ".s:GetTxtObj(a:type)
endfunction

function! s:AgTxtObjInCurrentDirectory(type)
    call fzf#vim#ag(s:GetTxtObj(a:type), extend({'dir': expand('%:p:h')}, fzf#vim#with_preview('right:50%:hidden', '?')))
endfunction

set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

function! s:QuickfixToggle()
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

function! s:Toggler(varName, fnClose, fnOpen)
    let l:vn = "toggle".a:varName
    if get(t:, l:vn, 0)
        execute a:fnOpen
        let t:[l:vn] = 0
    else
        execute a:fnClose
        let t:[l:vn] = 1
    endif
endfunction

function! s:GitCheckoutBranch(branch)
    " branch can look like this: "/remotes/origin/master [hash] info" or this: "master [hash] info"
    let l:name = split(split(trim(a:branch), "", 1)[0], "/", 1)[-1]
    
    " just show what is happening
    echo "checking out ".l:name."\n"
    
    " you can use !git, instead of Git, if you don't have Fugitive
    execute "Git checkout ".l:name
endfunction

" -a option lists all branches (remotes aswell)
" -vv option shows more information about branch
" --color and --ansi enables colors
" --nth=1 makes sure you only search by names and not branch info
command! -bang Gbranch call fzf#run(fzf#wrap({'source': 'git branch -avv --color', 'sink': function('<SID>GitCheckoutBranch'), 'options': '--ansi --nth=1'}, <bang>0))
" ---- }}}}
