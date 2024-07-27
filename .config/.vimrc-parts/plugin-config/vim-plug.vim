let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  h    ttps://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/autoload/')
Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'vim-syntastic/syntastic'
Plug 'rstacruz/vim-closer'
Plug 'mg979/vim-visual-multi', {'branch':'master'}
Plug 'junegunn/vim-easy-align'
call plug#end()
