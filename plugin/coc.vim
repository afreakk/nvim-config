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

