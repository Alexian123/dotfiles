#!/bin/bash

# create required directories
./scripts/init_dirs.sh

# install all dependencies
./scripts/install_dependencies.sh

# copy the dotfiles repo to the correct place
cp -r ./* $HOME/Source/personal/dotfiles/

# link the dotfiles to their expected places
./scripts/deploy_dotfiles.sh

# enable required services
sudo systemctl enable lightdm.service
sudo systemctl enable bluetooth.service
sudo systemctl enable ufw.service

# download and install wallpaper, avatar and qtile bar icons
cd ~/Downloads
sudo wget 'http://download1477.mediafire.com/3d0ec90zfqdg/ekfhhsoy617ci69/image_pack.tar.gz'
tar xpvf ~/Downloads/image_pack.tar.gz
mv ~/Downloads/image_pack/wallpapers ~/Pictures/
mv ~/Downloads/image_pack/bar_icons ~/Pictures/
sudo mv ~/Downloads/image_pack/helmet.jpg /usr/share/avatar/
sudo mv ~/Downloads/image_pack/login.jpg /usr/share/wallpapers/

# cleanup
rm -rf ~/Downloads/image_pack 
rm -rf ~/Downloads/image_pack.tar.gz
rm -rf ~/Downloads/yay

# update the database so you can use locate to search for files
sudo updatedb

# end message
echo "The installation is complete. Please reboot."
