let mapleader = "<Space>"

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
nnoremap <silent> c "_c
nnoremap <silent> cx c
nnoremap <silent> cc "_cc
nnoremap <silent> ccx cc
nnoremap <silent> C "_C
nnoremap <silent> Cx C
" visual
vnoremap <silent> c "_c
vnoremap <silent> cx c
vnoremap <silent> cc "_cc
vnoremap <silent> ccx cc
vnoremap <silent> C "_C
vnoremap <silent> Cx C
" visual block
xnoremap <silent> c "_c
xnoremap <silent> cx c
xnoremap <silent> cc "_cc
xnoremap <silent> ccx cc
xnoremap <silent> C "_C
xnoremap <silent> Cx C

" delete modifications

" normal
nnoremap <silent> d "_d
nnoremap <silent> dx d
nnoremap <silent> dd "_dd
nnoremap <silent> ddx dd
nnoremap <silent> D "_D
nnoremap <silent> Dx D

" visual
vnoremap <silent> d "_d
vnoremap <silent> dx d
vnoremap <silent> dd "_dd
vnoremap <silent> ddx dd
vnoremap <silent> D "_D
vnoremap <silent> Dx D
" visual block
xnoremap <silent> d "_d
xnoremap <silent> dx d
xnoremap <silent> dd "_dd
xnoremap <silent> ddx dd
xnoremap <silent> D "_D
xnoremap <silent> Dx D

" 'matt' commands

" normal
nnoremap <silent> Ms :%s/
nnoremap <silent> Mc :%s/@+/
nnoremap <silent> MC :%S/@+/
nnoremap <silent> Mp :put<CR>
nnoremap <silent> MP :put!<CR>

" visual
vnoremap <silent> Ms :%s/
vnoremap <silent> Mc :%s/@+/
vnoremap <silent> MC :%S/@+/
vnoremap <silent> Mp :put<CR>
vnoremap <silent> MP :put!<CR>

" visual block
xnoremap <silent> Ms :%s/
xnoremap <silent> Mc :%s/@+/
xnoremap <silent> MC :%S/@+/
xnoremap <silent> Mp :put<CR>
xnoremap <silent> MP :put!<CR>

nnoremap <silent> <Leader>Ay ggVGy
nnoremap <silent> <Leader>Ad ggVGd
nnoremap <silent> <Leader>Av ggVG

" edit helpers
nnoremap <silent> bc VaB
nnoremap <silent> bp Vab
nnoremap <silent> bs Va[
nnoremap <silent> sx Va<
nnoremap <silent> bcy VaBVy
nnoremap <silent> bpy VabVy
nnoremap <silent> bsy Va[Vy
nnoremap <silent> bxy Va<Vy
nnoremap <silent> bcx VaBVx
nnoremap <silent> bpx VabVx
nnoremap <silent> bsx Va[Vx
nnoremap <silent> bxx Va<Vx
nnoremap <silent> bcd VaBVd
nnoremap <silent> bpd VabVd
nnoremap <silent> bsd Va[Vd
nnoremap <silent> bxd Va<Vd

