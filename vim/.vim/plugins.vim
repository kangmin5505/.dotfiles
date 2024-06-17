call plug#begin('~/.vim/plugged')

" https://github.com/scrooloose/nerdtree
Plug 'scrooloose/nerdtree'

" https://github.com/junegunn/fzf.vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()
