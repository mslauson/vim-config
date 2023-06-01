currentPath="$(pwd)"
    rm -rf ~/.config/nvim/lua/user
    ln -s "$currentPath"/user ~/.config/nvim/lua/user
    
    rm -rf ~/.vimrc
    ln -s "$CurrentPath"/vimrc ~/.vimrc
