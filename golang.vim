let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_function_calls = 1
let g:go_metalinter_autosave = 1
let g:go_metalinter_enabled = ['vet', 'errcheck', 'staticcheck']
let g:go_metalinter_autosave_enabled = ['vet', 'errcheck', 'staticcheck']
let g:go_fmt_command = "goimports"
let g:go_def_mapping_enabled = 0
" override go to x hotkeys for go files, use vim-go instead of coc-nvim
autocmd FileType go     nnoremap <buffer> gy :GoDefType<CR>
autocmd FileType go     nnoremap <buffer> gr :GoReferrers<CR>
autocmd FileType go     nnoremap <buffer> gd :GoDef<CR>
