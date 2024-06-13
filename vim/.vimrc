set splitbelow
set splitright
set nocompatible
augroup MyAutoCmd
    autocmd!
augroup END

set laststatus=2
set hidden
set wildignore+=*/tmp/*,*/temp*/,*.so,*.o,*.obj,*.pyc,*.pyo,*.swp,*.swn,*/dist/*,
set wildignore+=*/build/*,*/test-data/*,*/lost+found/*

set cinkeys-=:
set expandtab
set shiftwidth=4
set ts=4
set sts=4
set tags=./tags
set bufhidden=delete
set shm=a
set tw=0
set backspace=2
set nowrap
set whichwrap+=h,l,<,>,[,]
set ruler
set iskeyword-=(
set readonly
set magic
set vb
set t_vb=
set autowrite
set matchtime=4
set cmdheight=2
set lazyredraw
set ignorecase
set smartcase
set autoindent
set smartindent
set noequalalways
set wmh=0
set scrolloff=10
set wildmenu
set wildmode=longest:list
set incsearch
set clipboard=unnamedplus
set nohls
set showmatch
set showmode
set synmaxcol=256
" Folding
set fillchars=vert:\|,fold:.
set path=.,,$VIM/,$HOME/
syntax on
filetype on
filetype indent on
filetype plugin on
set background=dark

function! CHANGE_CURR_DIR()
    if &buftype != "terminal"
        if (strlen(@%)!=0)
            exec "cd " . fnameescape(expand("%:p:h"))
        endif
    endif
endfunction

autocmd BufEnter * call CHANGE_CURR_DIR()

let mapleader = ","
let g:mapleader = ","
let maplocalleader = ","
let g:maplocalleader = ","

nnoremap <Leader>, <C-w>p

" set viminfo=%.'50,\"100,:30,n~/.viminfo
