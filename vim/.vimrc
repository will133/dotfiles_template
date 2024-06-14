" Global Functions
if has("unix")
    let vimrc='~/.vimrc'
else
    let vimrc='$HOME\.vimrc'
endif

" Settings
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

" Leader Key Mapping
nnoremap <Leader>, <C-w>p
" <Leader>q: Quote words with backticks
nnoremap <Leader>qt gewi``<Esc>ea``<Exc>
nnoremap <silent> q" ciw"<C-r>""<Esc>
vnoremap <silent> q" c"<C-r>""<Esc>
nnoremap <silent> q' ciw'<c-r>"'<Esc>
vnoremap <silent> q' c'<c-r>"'<Esc>
nnoremap <silent> qb ciw``<c-r>"``<Esc>
vnoremap <silent> qb c``<C-r>"``<Esc>

" <Leader>e:
nnoremap <Leader>e :bnext<cr>
" <Leader>r:
" <Leader>t:
" <Leader>y:
" <Leader>u: source .vimrc
nnoremap <Leader>u :source <c-r>=vimrc<cr><cr>
xnoremap <Leader>u :s/\(\1\)\(\u\)/\1\_\l\2/gc<cr>
" <Leader>i:
" <Leader>o:
nnoremap <Leader>o :only<cr>
" <Leader>p:
" <Leader>a:
" <Leader>s:
" <Leader>d:
nnoremap <Leader>d :bd<cr>
" <Leader>f:
" <Leader>g:
" <Leader>j:
" <Leader>k:
" <Leader>l:
" <Leader>z:
" <Leader>x:
" <Leader>c:
" <Leader>v: Edit .vimrc
nnoremap <Leader>v :sp <c-r>=vimrc<cr><cr>
" <Leader>b:
nnoremap <Leader>b :bprevious<cr>
" <Leader>n:
" <Leader>m:

" Command Mode:
" Bash like command line
cnoremap <c-a> <home>
cnoremap <c-e> <end>
" Move left/right by word
cnoremap <c-h> <s-left>
cnoremap <c-l> <s-right>

" Ctrl-Space: show history
cnoremap <c-@> <c-f>
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-f> <left>
cnoremap <c-g> <right>

" set viminfo=%.'50,\"100,:30,n~/.viminfo

" Normal Mode
" w: Move word forward
" e: replace single char
" t: find tilly: yank
" u: undo
" i: insert before cursor
" o: insert line below cursor
" p: paste
" a: insert after cursor
" s: substitute
" d: delete
" f: find
" g: many functions
" h: left
" j: down
" k: up
" l: right
" ;:
" ': go to mark
" z: many functions
" x: delete char
" c: change
" v: visual mode
" b: move word backward
" n: next
" m: mark
" ,: leader
" .: repeat last command
" /: search
" <space>: scroll down a page
nnoremap <Space> <PageDown>

" Q: format paragraph
nnoremap Q gq
vnoremap Q gq
" W:
" E: resize Window
nnoremap E :resize +15<cr>
" R: replace mode
" T: find till backwards
" Y: yarnk text
" U: redos
" I: insert beginning of line
" O: insert line above
" P: paste above line
" {: beginning of paragraph
" }: end of paragraph
" _: horizontal split
nnoremap _ :sp<cr>
" |: vertical split
nnoremap <bar> :vsp<cr>
" A: insert at the end of line
" S: seek backward
" D: deletes til the end of line
" F: find backwards
" G: go to end of file
" H: go to beginning of buffer
" J: join text
" K: lookup word
" L: go to end of file
" ::
" ": handles registers
" Z:
" X: delete char backword
" C: delete rest of line and go into insert mode
" V: visual line mode
" B: (default is move word backward), map this to resize window horizontally
nnoremap B :resize -15<cr>
" N: find next backward
" M: move cursor to mid screen
" <: indent left
" >: indent right
" ?: search backwards
" -: contract the fold
nnoremap - zm
" +: expand the fold
nnoremap + zr

" Visual Mode Key Mappings
" Backspace: Delete selected and go into insert mode
xnoremap <bs> c
" tab: indent
xmap <Tab> >
" shift-tab: unindent
xmap <s-tab> <

" Normal Mode Ctrl Key Mappings
" <c-q>: visual block mode
" <c-w>: window management
" <c-e>: expand current window vertically
noremap <c-e> :vertical resize +15<cr>
" <c-r>:
" <c-t>: pop stack
" <c-y>: multi cursor next key
" <c-u>: location list previous
noremap <c-u> :lprev<cr>
" <c-i>: location list next
noremap <c-u> :lnext<cr>
" <c-o>:
" <c-p>:
noremap <c-p> :cp<cr>
" <c-[>: Esc
" <c-]>: go forward in tag stack
" <c-\>:
" <c-a>:
" <c-s>:
" <c-d>:
" <c-f>:
" <c-g>: diffget and go to next error
" nnoremap <c-g> :diffget<CR>]czz
" <c-h>: move cursor to top window
nnoremap <c-h> <c-w>h
" <c-j>:
nnoremap <c-j> <c-w>j
" <c-k>:
nnoremap <c-k> <c-w>k
" <c-l>:
nnoremap <c-l> <c-w>l
" <c-z>: command key for tmux
" <c-x>:
" <c-c>:
" <c-v>:
" <c-b>:
" <c-n>: next error in error list
nnoremap <c-n> :cn<cr>
" <c-m>: same as enter

" Insert Mode Ctrl
" <c-q>: quoted insert
" <c-w>: delete previous word, create undo point
inoremap <c-w> <c-g>u<c-w>
" <c-e>: go to end of line
inoremap <c-e> <esc>A
" <c-r>: insert register
" <c-t>: indent shiftwidth
" <c-y>: insert char above cursor
" <c-u>: delete til beginning of line, create undo point
inoremap <c-u> <c-g>u<c-u>
" <c-i>: tab
" <c-o>: execute one normal mode command
" <c-p>: auto complete previous
" <c-[>:
" <c-]>:
" <c-\>:
" <c-a>: go to beginning of line
inoremap <-a> <esc>I
" <c-s>:
" <c-d>: unindent shiftwidth
" <c-f>: move cursor left
inoremap <c-f> <Left>
" <c-g>: move cursor right
" <c-h>: move word left
inoremap <c-h> <c-o>b
" <c-j>: move cursor up (including menu)
inoremap <expr <c-j> pumvisible() ? "\<C-e>\<Down>" : "\<Down>"
" <c-k>:
inoremap <expr <c-k> pumvisible() ? "\<C-e>\<Up>" : "\<Up>"
" <c-l>: move word right
inoremap <c-l> <c-o>w
" <c-z>: this is the command key for tmux
" <c-x>: delete char under cursor
" <c-c>:
" <c-v>: Paste
inoremap <c-v> <c-g>u<c-o>gP
" <c-b>:
" <c-n>: Autocomplete next
" <c-m>: same as enter


" Visual Mode Ctrl Key Mappings
" q
" w
" e
" r
" t
" y
" u
" i
" o
" p
" [
" ]
" \
" a
" s
" d
" f
" g
" h
" j
" k
" l
" z
" x
" c
" v
" b
" n
" m
" 
