" Keybind to comment out a line
vmap <D-/> <Esc>I // <Esc>

" Align Github-flavored Markdown tables
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
