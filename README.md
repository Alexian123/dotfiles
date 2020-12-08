# Arch Linux Dotfiles 

<a href="https://www.archlinux.org"><img src="/icons/arch.png" width="100"/></a> &nbsp;&nbsp;&nbsp; <a href="https://github.com/Airblader/i3"><img src="/icons/i3.png" width="100"/></a> &nbsp;&nbsp;&nbsp; <a href="http://www.qtile.org"><img src="/icons/qtile.png" width="100"/></a> &nbsp;&nbsp;&nbsp; <a href="http://openbox.org/wiki/Main_Page"><img src="/icons/openbox.jpg" width="100"/></a>

## Contents
  * [Description](#description)
  * [Installation](#installation)
      * [Requirements](#requirements)
  * [Post-installation](#post-installation)
  * [Gallery](#gallery)
      * [i3-gaps](#i3-gaps)
      * [Qtile](#qtile)
      * [OpenBox](#openbox)

## Description
<p>This is a work-in-progress setup of Arch Linux on a laptop with 3 window managers: i3-gaps, Qtile and OpenBox.</p>
<p>It is meant to be used on a fresh install of Arch Linux, with a user account and networking already configured.</p>
<p>I might make an install script for the OS itself in the future.</p>

## Installation
### Requirements
<ul>
 <li>enable multilib support</li>
 <li>install git</li>
 <li>install base-devel</li>
 <li>make sure your distro uses systemd</li>
 <li>internet connection</li>
 <li>(optional but recommended) install networkmanager and enable the NetworkManager service</li>
 <li>idealy, install from a tty on a fresh Arch system (or at least one without an existing DE/WM and DM)
</ul>

<p>git clone https://github.com/Alexian123/dotfiles</p>
<p>cd dotfiles</p>
<p>cp package_list.txt.def package_list.txt<p>
<p># Now edit package_list.txt with your terminal text editor of choice and modify the OPTIONAL section. Make sure to add apropriate drivers for your hardware. Empty lines and lines which start with "#" are regarded as comments and therefore ignored by the script. Do not edit package_list.txt.def, as that's the one which I update.</p>
<p>./install.sh</p>
<p># DO NOT RUN THE SCRIPT AS ROOT! If you do so, it should be obvious that your personal user won't have access to any of the dotfiles. The script will automatically ask for sudo privileges when it needs to install packages or modify system files, so just enter your password when prompted. It is always best to examine what a script does before running it on your system! Notice that it will download an archive of images from MediaFire. You can comment out those lines in case you do not trust the site!<p>

## Post-installation
<ul>
 <li>To get the latest configs, run 'cd  ~/Source/personal/dotfiles && git pull'.</li>
 <li>Do not move, delete or rename the ~/Source/personal/dotfiles directory or its parents, as all the system configs will be linked to it.</li>
 <li>Your monitor setup will most likely be different from mine, so replace the files from ./screenlayout with ones that work properly for your setup. You can generate those using arandr, just make sure to save them in the right place (~/Source/personal/dotfiles/screenlayout) by overwritting the existing files. You may need to set up lightdm to use one of those files in case it doesn't use the correct resolution by default.</li>
 <li>Append 'QT_QPA_PLATFORMTHEME=qt5ct' to /etc/environment to be able to set the qt theme with qt5ct.</li>
 <li>You may also need to use different keyboard layouts, so modify the gxkb config file (~/Source/personal/dotfiles/gxkb/gxkb.cfg).</li>
 <li>Don't forget to set your wallpaper with nitrogen. You can find some pre-installed wallpapers in ~/Pictures/wallpapers.</li>
 <li>The first time you use neovim you should run ':PlugInstall'.</li>
 <li>Lastly, consider changing your default shell to zsh using 'chsh'.</li>
</ul>

## Gallery

## i3-gaps
<img src="screenshots/i3.png">

## Qtile
<img src="screenshots/qtile.png">

## OpenBox
<img src="screenshots/openbox.png">
