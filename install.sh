#!/bin/bash

# create required directories
./scripts/init_dirs.sh

# install all dependencies
./scripts/install_dependencies.sh

# copy the dotfiles dir to the correct place
cp -r ./ $HOME/Source/personal/dotfiles/

# link the dotfiles to their expected places
./scripts/deploy_dotfiles.sh

# generate openbox menu
mmaker -v OpenBox3 -f

# neovim plugin manager
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# enable required services
sudo systemctl enable lightdm.service
sudo systemctl enable bluetooth.service
sudo systemctl enable ufw.service

# lightdm greeter
sudo cp $DOTFILES/lightdm/lightdm-gtk-greeter.conf /etc/lightdm/

# download and install wallpaper, avatar and qtile bar icons
cd ~/Downloads
git clone 'https://github.com/Alexian123/image_pack'
cd image_pack
tar xpvf image_pack.tar.gz
mv image_pack/wallpapers ~/Pictures/
mv image_pack/bar_icons ~/Pictures/
sudo mv image_pack/helmet.jpg /usr/share/avatars/
sudo mv image_pack/login.jpg /usr/share/wallpapers/

# cleanup
rm -rf ~/Downloads/image_pack 
rm -rf ~/Downloads/yay

# update the database so you can use locate to search for files
sudo updatedb

# end message
echo "The installation is complete. Please reboot."
