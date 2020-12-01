# Arch Linux Dotfiles
<br>
This is a work-in-progress setup of Arch Linux on a laptop with 3 window managers: i3, Qtile and OpenBox.<br>
It is meant to be used on a fresh install of Arch Linux (with a user account and networking already configured).<br>
I might make an install script for the OS itself in the future.<br>
<br>
INSTALLATION (requires git and an internet connection; other dependencies will be installed automatically)<br>
Run the following commands in a tty:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;git clone https://github.com/Alexian123/dotfiles<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cd ./dotfiles<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;./install.sh<br>
<br>
Enter your password when asked (required to install dependencies).
<br><br>
IMPORTANT<br>
Your monitor setup will most likely be different from mine, so replace the files from ./screenlayout with ones that work properly for your setup. You can generate those using arandr, just make sure to save them in the right place (~/Source/personal/dotfiles/screenlayout).
