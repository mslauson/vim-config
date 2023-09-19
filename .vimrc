let mapleader = " "

" plugins
Plug 'tpope/vim-abolish'
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'mg979/vim-visual-multi'

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
nnoremap  c "_c
nnoremap ciw "_ciw
nnoremap  cx c
nnoremap  cc "_cc
nnoremap  ccx cc
nnoremap  C "_C
nnoremap  Cx C
" visual
vnoremap  c "_c
vnoremap  cx c
vnoremap  cc "_cc
vnoremap  ccx cc
vnoremap  C "_C
vnoremap  Cx C
" visual block
xnoremap  c "_c
xnoremap  ciw "_ciw
xnoremap  caw "_caw
xnoremap  cx c
xnoremap  cc "_cc
xnoremap  ccx cc
xnoremap  C "_C
xnoremap  Cx C

" delete modifications

" normal
nnoremap  d "_d
nnoremap  dx d
nnoremap  dd "_dd
nnoremap  ddx dd
nnoremap  D "_D
nnoremap  Dx D

" visual
vnoremap  d "_d
vnoremap  dx d
vnoremap  dd "_dd
vnoremap  ddx dd
vnoremap  D "_D
vnoremap  Dx D
" visual block
xnoremap  d "_d
xnoremap  dx d
xnoremap  dd "_dd
xnoremap  ddx dd
xnoremap  D "_D
xnoremap  Dx D

" 'matt' commands

" normal
nnoremap  Ms :%s/
nnoremap  Mc :%s/@+/
nnoremap  MC :%S/@+/
nnoremap  Mp :put<CR>
nnoremap  MP :put!<CR>

" visual
vnoremap  Ms :%s/
vnoremap  Mc :%s/@+/
vnoremap  MC :%S/@+/
vnoremap  Mp :put<CR>
vnoremap  MP :put!<CR>

" visual block
xnoremap  Ms :%s/
xnoremap  Mc :%s/@+/
xnoremap  MC :%S/@+/
xnoremap  Mp :put<CR>
xnoremap  MP :put!<CR>

nnoremap  <Leader>Ay ggVGy
nnoremap  <Leader>Ad ggVGd
nnoremap  <Leader>Av ggVG

" edit helpers
nnoremap  bc VaB
nnoremap  bp Vab
nnoremap  bs Va[
nnoremap  sx Va<
nnoremap  bcy VaBVy
nnoremap  bpy VabVy
nnoremap  bsy Va[Vy
nnoremap  bxy Va<Vy
nnoremap  bcx VaBVx
nnoremap  bpx VabVx
nnoremap  bsx Va[Vx
nnoremap  bxx Va<Vx
nnoremap  bcd VaBVd
nnoremap  bpd VabVd
nnoremap  bsd Va[Vd
nnoremap  bxd Va<Vd

