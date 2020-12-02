# Arch Linux Dotfiles
<br>
This is a work-in-progress setup of Arch Linux on a laptop with 3 window managers: i3, Qtile and OpenBox.<br>
It is meant to be used on a fresh install of Arch Linux, with a user account and networking already configured(the networkmanager package must be installed and the NetworkManager service must be enabled).<br>
I might make an install script for the OS itself in the future.<br>
<br>
INSTALLATION (requires git, base-devel, systemd and an internet connection; other dependencies will be installed automatically)<br>
Run the following commands in a tty:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;git clone https://github.com/Alexian123/dotfiles<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cd ./dotfiles<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;./install.sh<br>
<br>
Enter your password when asked (required to install dependencies).
<br><br>
IMPORTANT<br>
Do not run the install script as root!<br>
Do not move, delete or rename the ~/Source/personal/dotfiles directory or its parents, as all the system configs will be linked to it.<br>
Your monitor setup will most likely be different from mine, so replace the files from ./screenlayout with ones that work properly for your setup. You can generate those using arandr, just make sure to save them in the right place (~/Source/personal/dotfiles/screenlayout).<br>
You likely need different video drivers (by default, only intel drivers are installed). Make sure you look through the OPTIONAL section at the top of ./package_list_arch.txt and replace what you don't need with what you do need. Unless you know what you're doing, do not modify other sections.<br><br>

To update, run 'cd  ~/Source/personal/dotfiles && git pull'.<br><br>

You may also need to use different keyboard layouts, so modify the gxkb config file (~/Source/personal/dotfiles/gxkb/gxkb.cfg).
