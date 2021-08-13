" now handled by treesitter
" xmap if <Plug>(coc-funcobj-i)
" omap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap af <Plug>(coc-funcobj-a)
" xmap ic <Plug>(coc-classobj-i)
" omap ic <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)


vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Window splitting/movement -------- {{{{
nnoremap <C-Up> <C-W>k
nnoremap <C-Down> <C-W>j
nnoremap <C-Left> <C-W>h
nnoremap <C-Right> <C-W>l

nmap <silent> <S-Up> :wincmd K<CR>
nmap <silent> <S-Down> :wincmd J<CR>
nmap <silent> <S-Left> :wincmd H<CR>
nmap <silent> <S-Right> :wincmd L<CR>
" }}}}

nmap <silent> <C-space> <Plug>(Fzm)
vmap <silent> <C-space> <Plug>(FzmVisual)
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Mapping selecting mappings
nmap <space><tab> <plug>(fzf-maps-n)
xmap <space><tab> <plug>(fzf-maps-x)
omap <space><tab> <plug>(fzf-maps-o)

nmap Y y$

nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)
tnoremap <S-Esc> <C-\><C-n>
nmap <C-S> <Plug>(choosewin)
nnoremap <silent> K :call <SID>show_documentation()<CR>
" from https://github.com/neoclide/coc.nvim#example-vim-configuration

" Use K to show documentation in preview window
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

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

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gd <Plug>(coc-definition)

" source ~/.config/nvim/golang.vim

" If your '{' or '}' are not in the first column, and you would like to use "[["
" and "]]" anyway, try these mappings:

" map [[ ?{<CR>w99[{:noh<cr>
" map ][ /}<CR>b99]}:noh<cr>
" map ]] j0[[%/{<CR>:noh<cr>
" map [] k$][%?}<CR>:noh<cr>
