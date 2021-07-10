command! -bang -nargs=? GFilesRecursive call fzf#vim#gitfiles(
      \"--recurse-submodules",
      \fzf#vim#with_preview('right:50%'),
      \<bang>0 )

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'


command! -bang -nargs=* Ggrep call fzf#vim#grep('git grep --recurse-submodules --line-number -- '.shellescape(<q-args>), 0, fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

command! -bang -nargs=+ -complete=dir Agr call fzf#vim#ag_raw(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

command! -bang -nargs=* Agc call fzf#vim#ag(<q-args>, extend({'dir': expand('%:p:h')}, fzf#vim#with_preview('right:50%:hidden', '?')))
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
  \                 <bang>0 ? fzf#vim#with_preview({},'up:60%')
  \                         : fzf#vim#with_preview({},'right:50%:hidden', '?'),
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
