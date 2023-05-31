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


nnoremap <silent> <leader>c "_c   " Change Without Cut
nnoremap <silent> cx c           " Change With Cut
nnoremap <silent> cc "_cc        " Change Without Cut
nnoremap <silent> ccx cc         " Change With Cut
nnoremap <silent> C "_C          " Change Without Cut
nnoremap <silent> Cx C           " Change With Cut
nnoremap <silent> d "_d          " Delete Without Cut
nnoremap <silent> dx d           " Delete With Cut
nnoremap <silent> dd "_dd        " Delete Without Cut
nnoremap <silent> ddx dd         " Delete With Cut
nnoremap <silent> D "_D          " Delete Without Cut
nnoremap <silent> Dx D           " Delete With Cut
nnoremap <silent> <leader>P :Telescope projects<CR>  " Project Management
nnoremap <silent> <leader>v :OverseerToggle<CR>      " Overseer Toggle
nnoremap <silent> U <C-r>         " Redo
nnoremap <silent> H :bprevious<CR> " Go to previous buffer
nnoremap <silent> L :bnext<CR>     " Go to next buffer
nnoremap <silent> <Left> :tabprevious<CR>   " Go to previous tab
nnoremap <silent> <Right> :tabNext<CR>     " Go to next tab
nnoremap <silent> [t :tabnext<CR>          " Go to next tab
nnoremap <silent> ]t> :tabnext<CR>         " Go to next tab
nnoremap <silent> md V:'<,'>t'><CR>        " Duplicate Line
nnoremap <silent> ms :%s/                " Global Substitute
nnoremap <silent> mS :%S/                " Global Subvert
nnoremap <silent> mc :%s/@+/             " Global Substitute Clipboard
nnoremap <silent> mC :%S/@+/             " Global Subvert Clipboard
nnoremap <silent> mp :put<CR>            " Paste On New Line Below
nnoremap <silent> mP :put!<CR>           " Paste On New Line Above
nnoremap <silent> <leader>\ :call <SID>tmuxSplitVertical()<CR>   " New Vertical Tmux Pane At Buffer CWD
nnoremap <silent> <leader>| :call <SID>tmuxSplitHorizontal()<CR> " New Horizontal Tmux Pane At Buffer CWD
nnoremap <silent> <Leader>Ay ggVGy     " Yank All
nnoremap <silent> <Leader>Ad ggVGd     " Delete All
nnoremap <silent> <Leader>Av ggVG      " Select All
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

vnoremap jk <Esc>
vnoremap jj <Esc>
vnoremap p "_dP      " Better Paste
vnoremap d "_d       " Delete Without Cut
vnoremap dx d        " Delete With Cut
vnoremap c "_c       " Change Without Cut
vnoremap cx c        " Change With Cut
vnoremap md :'<,'>t'><CR>   " Duplicate Selection
vnoremap ms :s/             " Selection Substitute
vnoremap mS :S/             " Selection Subvert
vnoremap mc :%s/@+/         " Global Substitute Clipboard
vnoremap mC :%S/@+/         " Global Subvert Clipboard
