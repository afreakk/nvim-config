let g:fzf_preview_window = ['right:50%:hidden', '?']
let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'
let s:home = expand("~")

" command! -bang -nargs=? VimFiles
    " \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview({'dir': '$HOME/.config/nvim/'}),  <bang>0)
command VimFiles call fzf#vim#gitfiles('', fzf#vim#with_preview({"dir": s:home."/.config/nvim" }))

command! -nargs=* VimFilesAg
    \ call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'dir': s:home.'/.config/nvim'}))

command! -nargs=? -complete=dir GFilesRecursive
    \ call fzf#vim#gitfiles("--recurse-submodules", fzf#vim#with_preview({'dir': <q-args>}))

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


" Insert mode completion (FZF)
imap <c-x><c-k> <plug>(fzf-complete-word)
inoremap <expr> <c-x><c-f> fzf#vim#complete#path(
    \ "find . -path '*/\.*' -prune -o -print \| sed '1d;s:^..::'",
    \ fzf#wrap({'dir': expand('%:p:h')}))
" imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
nmap <space><tab> <plug>(fzf-maps-n)
xmap <space><tab> <plug>(fzf-maps-x)
omap <space><tab> <plug>(fzf-maps-o)

nnoremap <Space>q :set operatorfunc=<SID>AgTxtObj<cr>g@
vnoremap <Space>q :<c-u>call <SID>AgTxtObj(visualmode())<cr>
nnoremap <Space>q<space> :Ag 

nnoremap <Space>qw :set operatorfunc=<SID>AgTxtObjInCurrentDirectory<cr>g@
vnoremap <Space>qw :<c-u>call <SID>AgTxtObjInCurrentDirectory(visualmode())<cr>
nnoremap <Space>qw<space> :Agc 

nnoremap <Space>qs :set operatorfunc=<SID>CocSymbolObj<cr>g@
vnoremap <Space>qs :<c-u>call <SID>CocSymbolObj(visualmode())<cr>

nnoremap <Space>qg :set operatorfunc=<SID>GitGrepTextObj<cr>g@
vnoremap <Space>qg :<c-u>call <SID>GitGrepTextObj(visualmode())<cr>
nnoremap <Space>qg<space> :Ggrep 

function! s:GetTxtObj(type)
    let prev_registered = @@
    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    else
        return
    endif
    let txtObj = @@
    let @@ = prev_registered
    return txtObj
endfunction

function! s:CocSymbolObj(type)
  execute 'CocList -I --normal --input='.s:GetTxtObj(a:type).' symbols'
endfunction

function! s:GitGrepTextObj(type)
    execute "Ggrep ".s:GetTxtObj(a:type)
endfunction

function! s:AgTxtObj(type)
    execute "Ag ".s:GetTxtObj(a:type)
endfunction

function! s:AgTxtObjInCurrentDirectory(type)
    call fzf#vim#ag(s:GetTxtObj(a:type), extend({'dir': expand('%:p:h')}, fzf#vim#with_preview('right:50%:hidden', '?')))
endfunction

