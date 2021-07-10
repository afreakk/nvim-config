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

