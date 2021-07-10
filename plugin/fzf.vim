let g:fzf_preview_window = ['right:50%:hidden', '?']
let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

command! -nargs=* VimFiles
            \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview({"dir": "~/.config/nvim"}))

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
command! Gbranch
    \ call fzf#run(fzf#wrap({'source': 'git branch -avv --color', 'sink': function('<SID>GitCheckoutBranch'), 'options': '--ansi --nth=1'}))
