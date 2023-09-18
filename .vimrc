
let mapleader = "<Space>"


function! s:tmuxSplitVertical()
    let buffer_directory = expand("%:p:h")
    let cmd = "tmux split-window -v -c " . shellescape(buffer_directory)
    call system(cmd)
endfunction

function! s:tmuxSplitHorizontal()
    let buffer_directory = expand("%:p:h")
    let cmd = "tmux split-window -h -c " . shellescape(buffer_directory)
    call system(cmd)
endfunction

set scrolloff=5
set clipboard+=unnamed
set incsearch
set hlsearch
set scrolloff=999
set ignorecase smartcase
set showmode
set history=1000
set incsearch
set clipboard+=unnamed
set relativenumber
set visualbell
set idearefactormode=keep
set showcmd
set showmode                      

" switch windows
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l

nnoremap L gt
noremap H gT
" Don't use Ex mode, use Q for formatting.
map Q gq

nmap Mx V:'<,'>t'><cr>
vmap Mx V:'<,'>t'><cr>
xmap Mx V:'<,'>t'><cr>

" fix redo
nnoremap U <C-r>
vnoremap U <C-r>
xnoremap U <C-r>

imap jj <Esc>
imap jk <Esc>

" change modifications

" normal
nnoremap <silent> c "_c   " Change Without Cut
nnoremap <silent> cx c           " Change With Cut
nnoremap <silent> cc "_cc        " Change Without Cut
nnoremap <silent> ccx cc         " Change With Cut
nnoremap <silent> C "_C          " Change Without Cut
nnoremap <silent> Cx C           " Change With Cut
" visual
vnoremap <silent> c "_c   " Change Without Cut
vnoremap <silent> cx c           " Change With Cut
vnoremap <silent> cc "_cc        " Change Without Cut
vnoremap <silent> ccx cc         " Change With Cut
vnoremap <silent> C "_C          " Change Without Cut
vnoremap <silent> Cx C           " Change With Cut
" visual block
xnoremap <silent> c "_c   " Change Without Cut
xnoremap <silent> cx c           " Change With Cut
xnoremap <silent> cc "_cc        " Change Without Cut
xnoremap <silent> ccx cc         " Change With Cut
xnoremap <silent> C "_C          " Change Without Cut
xnoremap <silent> Cx C           " Change With Cut

" delete modifications

" normal
nnoremap <silent> d "_d          " Delete Without Cut
nnoremap <silent> dx d           " Delete With Cut
nnoremap <silent> dd "_dd        " Delete Without Cut
nnoremap <silent> ddx dd         " Delete With Cut
nnoremap <silent> D "_D          " Delete Without Cut
nnoremap <silent> Dx D           " Delete With Cut

" visual
vnoremap <silent> d "_d          " Delete Without Cut
vnoremap <silent> dx d           " Delete With Cut
vnoremap <silent> dd "_dd        " Delete Without Cut
vnoremap <silent> ddx dd         " Delete With Cut
vnoremap <silent> D "_D          " Delete Without Cut
vnoremap <silent> Dx D           " Delete With Cut
" visual block
xnoremap <silent> d "_d          " Delete Without Cut
xnoremap <silent> dx d           " Delete With Cut
xnoremap <silent> dd "_dd        " Delete Without Cut
xnoremap <silent> ddx dd         " Delete With Cut
xnoremap <silent> D "_D          " Delete Without Cut
xnoremap <silent> Dx D           " Delete With Cut

" 'matt' commands

" normal
nnoremap <silent> Ms :%s/                " Global Substitute
nnoremap <silent> Mc :%s/@+/             " Global Substitute Clipboard
nnoremap <silent> MC :%S/@+/             " Global Subvert Clipboard
nnoremap <silent> Mp :put<CR>            " Paste On New Line Below
nnoremap <silent> MP :put!<CR>           " Paste On New Line Above

" visual
vnoremap <silent> Ms :%s/                " Global Substitute
vnoremap <silent> Mc :%s/@+/             " Global Substitute Clipboard
vnoremap <silent> MC :%S/@+/             " Global Subvert Clipboard
vnoremap <silent> Mp :put<CR>            " Paste On New Line Below
vnoremap <silent> MP :put!<CR>           " Paste On New Line Above

" visual block
xnoremap <silent> Ms :%s/                " Global Substitute
xnoremap <silent> Mc :%s/@+/             " Global Substitute Clipboard
xnoremap <silent> MC :%S/@+/             " Global Subvert Clipboard
xnoremap <silent> Mp :put<CR>            " Paste On New Line Below
xnoremap <silent> MP :put!<CR>           " Paste On New Line Above

nnoremap <silent> <Leader>Ay ggVGy     " Yank All
nnoremap <silent> <Leader>Ad ggVGd     " Delete All
nnoremap <silent> <Leader>Av ggVG      " Select All

" edit helpers
nnoremap <silent> bc VaB               " Block Select {}
nnoremap <silent> bp Vab               " Block Select ()
nnoremap <silent> bs Va[               " Block Select []
nnoremap <silent> sx Va<               " Block Select []
nnoremap <silent> bcy VaBVy             " Block Yank {}
nnoremap <silent> bpy VabVy             " Block Yank ()
nnoremap <silent> bsy Va[Vy             " Block Yank []
nnoremap <silent> bxy Va<Vy             " Block Yank <>
nnoremap <silent> bcx VaBVx             " Block Cut {}
nnoremap <silent> bpx VabVx             " Block Cut ()
nnoremap <silent> bsx Va[Vx             " Block Cut []
nnoremap <silent> bxx Va<Vx             " Block Cut <>
nnoremap <silent> bcd VaBVd             " Block Delete {}
nnoremap <silent> bpd VabVd             " Block Delete ()
nnoremap <silent> bsd Va[Vd             " Block Delete []
nnoremap <silent> bxd Va<Vd             " Block Delete <>


Plug 'tpope/vim-abolish'
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
