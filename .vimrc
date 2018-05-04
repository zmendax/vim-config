" Turn off compatibility mode
set nocompatible

" encoding
set encoding=utf-8
set fenc=utf-8

" Highlight current line
set cursorline
set cursorcolumn
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn

" Search results high light
set hlsearch
set incsearch
set ignorecase

" set background=dark
set t_Co=256
set history=100     

set number
set ruler           " show the cursor position all the time
set laststatus=2

set showcmd         " display incomplete commands
set showmatch

set backspace=indent,eol,start     " backspace works normally
filetype indent on
set expandtab
set tabstop=4
set shiftwidth=4


" Plugins manage
filetype off

if filereadable(expand("~/.vimrc.plugged"))
    source ~/.vimrc.plugged
endif

filetype plugin indent on 


" Color scheme
colorscheme zenburn
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0


" Leader
let mapleader = ";"

vnoremap <Leader>y "+y
nmap <Leader>p "+p

" key mapping
imap jk <ESC>
nmap <C-A> ^
nmap <C-E> $
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l
nmap <C-H> <C-W>h


" Nerd Tree
let NERDTreeWinPos = "right"
let NERDTreeWinSize = 22
let NERDTreeMiniUI=1
let NERDTreeAutoDeleteBuffer=1
nmap <Leader>lf :NERDTreeToggle<CR>


" Minibufexp1
map <Leader>lb :MBEToggle<cr>
" buffer change
map <C-Tab> :MBEbn<cr>
map <C-S-Tab> :MBEbp<cr>


" easymotion
map  / <Plug>(easymotion-sn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion"


" powerline
let g:Powerline_colorscheme='solarized256'

" indentLine
let g:indentLine_char='|'
let g:indentLine_enabled = 1
" autopep8
let g:autopep8_disable_show_diff=1

" onekey run python
map <F6> :Autopep8<CR> :w<CR> :call RunPython()<CR>
function RunPython()
    let mp = &makeprg
    let ef = &errorformat
    let exeFile = expand("%:t")
    setlocal makeprg=python\ -u
    set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
    silent make %
    copen
    let &makeprg = mp
    let &errorformat = ef
endfunction
