currentPath="$(pwd)"
    
echo "Do you want to init for root?"
select yn in "Yes" "No" "Cancel"; do
    case $yn in
        Yes ) 
            echo "Initializing for root and $USER"
            rm -rf /home/root/.config/nvim
            git clone --depth 1 https://github.com/AstroNvim/AstroNvim /home/root/.config/nvim
            ln -s "$currentPath"/user ~/.config/nvim/lua/user
            rm -rf ~/.config/nvim/lua/user
            rm -rf /home/root/.vimrc
            ln -s "$CurrentPath"/vimrc /home/root/.vimrc
            break;;
        No )
            echo "Initializing for $USER"
            break;;
        Cancel ) 
            echo "No config was changed!"
            exit
            ;;
    esac
done
   
rm -rf ~/.config/nvim
git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
rm -rf ~/.config/nvim/lua/user
ln -s "$currentPath"/user ~/.config/nvim/lua/user

rm -rf ~/.vimrc
ln -s "$CurrentPath"/vimrc ~/.vimrc
