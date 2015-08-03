execute pathogen#infect()

syntax enable
" http://ethanschoonover.com/solarized/vim-colors-solarized
"set t_Co=256
if !has("gui_running")
  let g:solarized_termcolors=256
endif
set background=dark
colorscheme solarized

set shiftwidth=4
set softtabstop=4
set expandtab

set autoindent
set autoread
set incsearch
set hlsearch
set laststatus=2
set number
set wildmenu
set wildmode=longest:full

set ignorecase
set smartcase

" Account for fat-fingeredness
com W w
com Wq wq

" Clear search highlights on ^L
nnoremap <silent> <c-l> <c-l>:nohlsearch<cr>

" easymotion: no need to leaderleader
map <Leader> <Plug>(easymotion-prefix)
