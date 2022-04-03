" Javascript my stuff -------- {{{{
augroup filetype_javascript
    autocmd!
    autocmd FileType javascript,javascriptreact,typescript,typescriptreact :iabbrev <buffer> clg console.log()<left>
    autocmd FileType javascript,javascriptreact,typescript,typescriptreact :iabbrev <buffer> iff if ()<left>
    autocmd FileType javascript,javascriptreact,typescript,typescriptreact :iabbrev <buffer> cc const
    autocmd FileType javascript,javascriptreact,typescript,typescriptreact :iabbrev <buffer> rr return 
    autocmd FileType javascript,javascriptreact,typescript,typescriptreact :iabbrev <buffer> prts propTypes = {}<left> 
    autocmd FileType javascript,javascriptreact,typescript,typescriptreact setlocal foldmethod=syntax
    autocmd FileType javascript,javascriptreact,typescript,typescriptreact setlocal foldnestmax=1
    set nofoldenable
augroup END
" }}}}

augroup filetype_gitcommit
    autocmd!
    autocmd FileType gitcommit :iabbrev <buffer> mz modernize
    autocmd FileType gitcommit setlocal spell
augroup END
" Vimscript file settings -------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

au BufRead nftables.conf set ft=nftables

autocmd FileType markdown setlocal spell
