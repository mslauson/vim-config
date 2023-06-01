currentPath="$(pwd)"
    
echo "Do you want to init for root?"
select yn in "Yes" "No" "Cancel"; do
    case $yn in
        Yes ) 
git clone --depth 1 https://github.com/AstroNvim/AstroNvim /home/root/.config/nvim
            ln -s "$currentPath"/user ~/.config/nvim/lua/user
            rm -rf ~/.config/nvim/lua/user
            rm -rf /home/root/.vimrc
            ln -s "$CurrentPath"/vimrc /home/root/.vimrc
            break;;
        No ) break;;
        Cancel ) 
            echo "No config was changed!"
            exit
            ;;
    esac
done
   
git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
rm -rf ~/.config/nvim/lua/user
ln -s "$currentPath"/user ~/.config/nvim/lua/user

rm -rf ~/.vimrc
ln -s "$CurrentPath"/vimrc ~/.vimrc
