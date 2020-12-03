# Arch Linux Dotfiles 

<img src="/icons/arch.png" width="100"/> &nbsp;&nbsp;&nbsp; <img src="/icons/i3.png" width="100"/> &nbsp;&nbsp;&nbsp; <img src="/icons/qtile.png" width="100"/> &nbsp;&nbsp;&nbsp; <img src="/icons/openbox.jpg" width="100"/>

## Contents
  * [Description](#description)
  * [Important Information](#important-information)
  * [Installation](#installation)
  * [Post-installation](#post-installation)
  * [Gallery](#gallery)
      * [i3](#i3)
      * [Qtile](#qtile)
      * [OpenBox](#openbox)

## Description
<p>This is a work-in-progress setup of Arch Linux on a laptop with 3 window managers: i3, Qtile and OpenBox.</p>
<p>It is meant to be used on a fresh install of Arch Linux, with a user account and networking already configured (the networkmanager package must be installed and the NetworkManager service must be enabled).</p>
<p>I might make an install script for the OS itself in the future.</p>

## Important Information
<ul>
    <li>Enable multilib before starting the installation (see /etc/pacman.conf).</li>
    <li>Do not run the install script as root!</li>
    <li>Do not move, delete or rename the ~/Source/personal/dotfiles directory or its parents, as all the system configs will be linked to it.</li>
    <li>Your monitor setup will most likely be different from mine, so replace the files from ./screenlayout with ones that work properly for your setup. You can generate those using arandr, just make sure to save them in the right place (~/Source/personal/dotfiles/screenlayout). You may need to set up lightdm to use one of those files in case it doesn't use the correct resolution by default.</li>
    <li>You likely need different video drivers (by default, only intel drivers are installed). Make sure you look through the OPTIONAL section at the top of           ./package_list.txt and replace what you don't need with what you do need. Unless you know what you're doing, do not modify other sections.</li>
    <li>Append 'QT_QPA_PLATFORMTHEME=qt5ct' to /etc/environment to be able to set the qt theme with qt5ct.</li>
</ul>

## Installation
<h3>Requirements: git, base-devel, systemd and an internet connection</h3>
<p>Run the following commands in a tty:</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;git clone https://github.com/Alexian123/dotfiles</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cd ./dotfiles</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;./install.sh</p>
<p>Enter your password when asked (required to install dependencies).</p>

## Post-installation
<p>To get the latest configs, run 'cd  ~/Source/personal/dotfiles && git pull'.</p>
<p>You may also need to use different keyboard layouts, so modify the gxkb config file (~/Source/personal/dotfiles/gxkb/gxkb.cfg).</p>
<p>Don't forget to set your wallpaper with nitrogen. You can find some pre-installed wallpapers in ~/Pictures/wallpapers.</p>
<p>The first time you run nvim you should run ':PlugInstall'.</p>
<p>Lastly, consider changing your default shell to zsh using 'chsh'.</p>

## Gallery

## i3
<img src="screenshots/i3.png">

## Qtile
<img src="screenshots/qtile.png">

## OpenBox
<img src="screenshots/openbox.png">
