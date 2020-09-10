
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


map <F8> :w<CR>:!clear;python3 %<CR>
map <F9> :w<CR>:!clear;python3 -i % <CR>
runtime! archlinux.vim
let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_server_python_interpreter = '/usr/bin/python3'
:syntax on

" Python IDE configuration
set splitbelow
set splitright
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

colo ron

"python auto header generation
autocmd bufnewfile *.py so ~/.vim/templates/py_header.txt
autocmd bufnewfile *.py exe "1," . 10 . "g/filename:.*/s//filename: " .expand("%")
autocmd bufnewfile *.py exe "1," . 10 . "g/Creation date:.*/s//Creation date : " .strftime("%d-%m-%Y")
autocmd Bufwritepre,filewritepre *.py execute "normal ma"
autocmd Bufwritepre,filewritepre *.py exe "1," . 10 . "g/Last modification date:.*/s/Last modification date:.*/Last modification date: " .strftime("%c")
autocmd bufwritepost,filewritepost *.py execute "normal `a"

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

inoremap { {}<c-o>i
inoremap [ []<c-o>i
inoremap ( ()<c-o>i

inoremap {<cr> {<cr>}<c-o>O
