#! /bin/bash

# Post-installation actions

# update font cache
fc-cache -f && echo "Updated font cache."

# enable servies
sudo systemctl enable lightdm.service
sudo systemctl enable NetworkManager.servce

# mlocate db
sudo updatedb

# set zsh as default user shell
chsh -s /usr/bin/zsh

# install starship prompt
echo "Installing starship prompt..." && sleep 2
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

# end message
echo "
The installation has finished. Reboot for everything to take effect."
