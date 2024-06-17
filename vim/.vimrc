syntax enable
set tabstop=4
set number
set hlsearch
set incsearch
set scrolloff=20

let mapleader = " "

" NERDTree (https://github.com/preservim/nerdtree)
nnoremap <leader>e :NERDTreeToggle<CR>

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

so ~/.vim/plugins.vim
