"       ,  {BULKLEY}  ,
"      //             \\
"     ((__,-"""""""-,__))
"     '----)~     ~(----`
"      .-'(  .    . )`-,
"      `~~`\       /`~~`
"           |     |
"           (o___o)
"            \___/
"            
syntax on
colo murphy
set hlsearch
set incsearch
set ignorecase
set smartcase
set titlestring=%t
set title
set ruler
set confirm
set spell
set softtabstop=4
set tabstop=2
set shiftwidth=2
set expandtab

filetype on
filetype plugin on
filetype indent on
set number
set wildmenu
let g:airline_theme='one'
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.md set complete+=kspell

" STATUS LINE ------------------------------------------------------------ {{{

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

" }}}

" COLORSCHEME ------------------------------------------------------------ {{{
"
colorscheme one
" }}}
