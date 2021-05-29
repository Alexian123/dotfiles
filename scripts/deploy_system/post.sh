#! /bin/bash

# Post-installation actions

# update font cache
echo "Updating font cache..."
fc-cache -f && echo "Done."

# enable servies
echo "Enabling systemd servies..." && sleep 2
sudo systemctl enable lightdm.service && \
    sudo systemctl enable NetworkManager.servce && \
    sudo systemctl enable bluetooth.servce && echo "Done."

# mlocate db
echo "Updating mlocale database..."
sudo updatedb && echo "Done."

# set zsh as default user shell
echo "Setting user shell to zsh..." && sleep 2
chsh -s /usr/bin/zsh && echo "Done."

# install starship prompt
echo "Installing starship prompt..." && sleep 2
sh -c "$(curl -fsSL https://starship.rs/install.sh)" && echo "Done."

# end message
echo "
The installation has finished. Reboot for everything to take effect."
