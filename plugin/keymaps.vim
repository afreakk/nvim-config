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
" Start Win-Move mode:
nnoremap <C-W><C-M> <Cmd>WinShift<CR>
nnoremap <C-W>m <Cmd>WinShift<CR>

" Swap two windows:
nnoremap <C-W>X <Cmd>WinShift swap<CR>

" If you don't want to use Win-Move mode you can create mappings for calling the
" move commands directly:
nnoremap <S-Left> <Cmd>WinShift left<CR>
nnoremap <S-Down> <Cmd>WinShift down<CR>
nnoremap <S-Up> <Cmd>WinShift up<CR>
nnoremap <S-Right> <Cmd>WinShift right<CR>

nnoremap <C-Up> <C-W>k
nnoremap <C-Down> <C-W>j
nnoremap <C-Left> <C-W>h
nnoremap <C-Right> <C-W>l
nmap Y y$
" }}}}

nmap <silent> <C-space> <Plug>(Fzm)
vmap <silent> <C-space> <Plug>(FzmVisual)
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Mapping selecting mappings
nmap <space><tab> <plug>(fzf-maps-n)
xmap <space><tab> <plug>(fzf-maps-x)
omap <space><tab> <plug>(fzf-maps-o)


nmap <space>s <plug>(SubversiveSubstitute)
nmap <space>ss <plug>(SubversiveSubstituteLine)
nmap <space>S <plug>(SubversiveSubstituteToEndOfLine)
tnoremap <S-Esc> <C-\><C-n>
nmap <C-S> <Plug>(choosewin)
nnoremap <silent> K :call <SID>show_documentation()<CR>
" from https://github.com/neoclide/coc.nvim#example-vim-configuration
" Use K to show documentation in preview window
function! s:show_documentation()
  if !(CocAction('hasProvider', 'hover') && CocAction('doHover'))
    call feedkeys('K', 'in')
  endif
endfunction

" Insert mode completion (FZF)
imap <c-x><c-k> <plug>(fzf-complete-word)
inoremap <expr> <c-x><c-f> fzf#vim#complete#path(
    \ "find . -path '*/\.*' -prune -o -print \| sed '1d;s:^..::'",
    \ fzf#wrap({'dir': expand('%:p:h')}))
" imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-implementation)

" source ~/.config/nvim/golang.vim

" If your '{' or '}' are not in the first column, and you would like to use "[["
" and "]]" anyway, try these mappings:

" map [[ ?{<CR>w99[{:noh<cr>
" map ][ /}<CR>b99]}:noh<cr>
" map ]] j0[[%/{<CR>:noh<cr>
" map [] k$][%?}<CR>:noh<cr>
