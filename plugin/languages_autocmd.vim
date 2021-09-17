" Javascript my stuff -------- {{{{
augroup filetype_javascript
    autocmd!
    autocmd FileType javascript,javascriptreact,typescript :iabbrev <buffer> clg console.log()<left>
    autocmd FileType javascript,javascriptreact,typescript :iabbrev <buffer> iff if ()<left>
    autocmd FileType javascript,javascriptreact,typescript :iabbrev <buffer> cc const
    autocmd FileType javascript,javascriptreact,typescript :iabbrev <buffer> rr return 
    autocmd FileType javascript,javascriptreact,typescript :iabbrev <buffer> prts propTypes = {}<left> 
    autocmd FileType javascript,javascriptreact,typescript setlocal foldmethod=syntax
    autocmd FileType javascript,javascriptreact,typescript setlocal foldnestmax=1
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
