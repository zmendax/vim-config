" Use Vim settings, rather then Vi settings. This setting must be as early
" as possible, as it has side effects.
set nocompatible

" Highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

" Leader
let mapleader = ";"

set backspace=2     " Backspace deletes like most programs in insert mode"
set background=dark
set t_Co=256
set nobackup
set noswapfile
set number
set history=100     
set ruler           " show the cursor position all the time
set showcmd         " display incomplete commands
set showmatch
set encoding=utf-8
set autoindent
set cindent

set ignorecase
" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

set mouse=a
set smarttab

if filereadable(expand("~/.vimrc.bundles"))
      source ~/.vimrc.bundles
endif

filetype plugin indent on 

" Color scheme
colorscheme molokai
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0

" key mapping
imap jk <ESC>
nmap 1 ^
nmap 0 $
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l
nmap <C-H> <C-W>h

" Nerd Tree
let NERDTreeWinPos = "left"
let NERDTreeWinSize = 30
let NERDTreeChristmasTree = 1
"autocmd vimenter * if !argc() | NERDTree | endif " Automatically open a NERDTree if no files where specified
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " Close vim if the only window left open is a NERDTree
nmap <F5> :NERDTreeToggle<cr>

" easymotion
map  / <Plug>(easymotion-sn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion"

" Search results high light
set hlsearch

" airline
set laststatus=2
let g:airline_theme = "molokai"
let g:airline_powerline_font=1
let g:airline_section_b = '%{strftime("%Y-%m-%d")}'
let g:airline_section_y = 'BN: %{bufnr("%")}'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
nmap <C-N> :bn<CR>
nmap <C-P> :bp<CR>
