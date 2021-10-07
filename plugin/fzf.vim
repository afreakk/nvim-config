let g:fzf_preview_window = ['right:50%:hidden', '?']
let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

command! -nargs=* VimFiles
            \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview({"dir": "~/.config/nvim"}))

command! -nargs=* VimFilesAg
    \ call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'dir': '$HOME/.config/nvim'}))

command! -nargs=? GFilesRecursive
    \ call fzf#vim#gitfiles("--recurse-submodules", fzf#vim#with_preview())

command! -nargs=* Ggrep
    \ call fzf#vim#grep('git grep --recurse-submodules --line-number -- '.shellescape(<q-args>),
    \ 0,
    \ fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}))

command! -nargs=+ -complete=dir Agr
    \ call fzf#vim#ag_raw(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}))

command! -nargs=* Agc
    \ call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'dir': expand('%:p:h')}))


command! -nargs=* Ag
    \ call fzf#vim#ag(<q-args>, fzf#vim#with_preview())

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -nargs=* Rg
  \ call fzf#vim#grep(
  \ 'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \ fzf#vim#with_preview())

" Search multiline
command! -nargs=* Rgm
  \ call fzf#vim#grep(
  \ 'rg --column --line-number --no-heading --color=always --smart-case --multiline '.shellescape(<q-args>), 1,
  \ fzf#vim#with_preview())


