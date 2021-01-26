" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'fatih/vim-go'

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required



" map <F8> :w<CR>:!clear;python %<CR>
" map <F9> :w<CR>:!clear;python -i % <CR>
runtime! archlinux.vim
let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_server_python_interpreter = '/usr/local/bin/python3.8'
let g:ycm_min_num_of_chars_for_completion = 1
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

set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4

set backspace=indent,eol,start

inoremap { {}<c-o>i
inoremap [ []<c-o>i
inoremap ( ()<c-o>i

inoremap {<cr> {<cr>}<c-o>O

autocmd BufNewFile,BufRead *.cql setfiletype sql
