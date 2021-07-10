" Cursor appearance t_SI etc -------- {{{{
set guicursor+=a:blinkon333
set guicursor+=a:blinkon0
" hi Cursor guifg=#121212 guibg=#afd700
" let &t_SI = "\<Esc>[5 q"
" let &t_SR = "\<Esc>[4 q"
" let &t_EI = "\<Esc>[2 q"
" }}}}

" GuiOptions -------- {{{{
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set guifont=Hack\ Nerd\ Font\ Mono:h13
if !has('nvim')
  set guiheadroom=0
endif
" }}}}
