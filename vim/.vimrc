syntax enable
set tabstop=4
set shiftwidth=4
set number
set hlsearch
set incsearch
set scrolloff=20
set autochdir
set backspace=indent,eol,start

let g:airline_theme='angr'
let mapleader=' '

" vim-plug automatic installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif


" NERDTree (https://github.com/preservim/nerdtree)
nnoremap <leader>e :NERDTreeToggle<CR>
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

if filereadable(expand("~/.tibero.vim"))
  source ~/.tibero.vim
endif
source ~/.vim/plugins.vim
source ~/.vim/cscope_maps.vim
