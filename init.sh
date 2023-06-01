currentPath="$(pwd)"
    
echo "Do you want to init for root?"
select yn in "Yes" "No" "Cancel"; do
    case $yn in
        Yes ) 
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
   
rm -rf ~/.config/nvim/lua/user
ln -s "$currentPath"/user ~/.config/nvim/lua/user

rm -rf ~/.vimrc
ln -s "$CurrentPath"/vimrc ~/.vimrc
