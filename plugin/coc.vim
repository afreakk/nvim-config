" Using CocList
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

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
\    "coc-go",
\    "coc-omnisharp",
\    "coc-highlight",
\    "coc-spell-checker",
\    "coc-sh",
\    "coc-snippets",
\ ]
" \    "coc-comrade",
" \    "coc-pairs",
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)
