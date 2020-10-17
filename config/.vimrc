set expandtab
set smarttab                                        
set shiftwidth=4                                    
set tabstop=4
set lbr
set tw=500
set ai
set si 
set wrap
set laststatus=2
syntax on
colorscheme peachpuff

call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()