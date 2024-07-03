"===============================================================================
" VIM settings
"===============================================================================
set nocompatible    " not compatible with 'VI'

"__encoding__
set fileencoding=utf-8
set encoding=utf-8
set fencs=utf-8,cp949,ucs-bom

"__indent__
set tabstop=4           " Tab space
set shiftwidth=4        " Indent space
set softtabstop=4       " Tab key space
set smarttab            " Backspace deletes tab space
set expandtab           " Tab -> space
set cindent             " C language indent
set cino=:0p0t0(0g1     " cindent option

"__CSCOPE__
set cst                 " cscopetag (:tag)
set csto=0              " cscopetagorder (0:db first, 1:tag first)

"__search__
set hlsearch            " highlight search result

"__ETC__
set number
set scrolloff=20        " Number of lines before bottom when scrolling vertically
set backspace=indent,eol,start  " backspace can delete anything
set wildignore=*.o,*.obj,*.a,*.bak,*.exe,*~
set formatoptions=cro   " c: Auto-wrap comments,
                    " r: Auto insert the current comment leader after 'Enter'
                    " o: Auto insert the current comment leader after 'o'|'O'
set colorcolumn=80
set cursorline

"__highlight__
" ctermbg=235 -> dark grey 
hi CursorLine       term=bold cterm=bold ctermbg=235
hi colorcolumn      ctermbg=235

"===============================================================================
" VIM Plugins
"===============================================================================
" vim-plug automatic installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let g:airline_theme='angr'

source $HOME/.vim/plugins.vim

"===============================================================================
" Functions
"===============================================================================
"===============================================================================
" Mappings
"===============================================================================
let mapleader=' '   " Use Space for leader key (default:\\)

nnoremap <leader>t :TagbarToggle<CR>
nnoremap <leader>e :NERDTreeToggle<CR>
source $HOME/.vim/cscope_maps.vim

"===============================================================================
" ETC
"===============================================================================
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

if filereadable(expand("~/.tibero.vim"))
  source ~/.tibero.vim
endif

" if filereadable("~/.vim/vimrc.tb")
"     so $HOME/.vim/vimrc.tb
" endif
