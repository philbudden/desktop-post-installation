#!/bin/bash

# Configure dns server:

bash -c "echo 'nameservers:
    [8.8.8.8,8.8.4.4]' >> /etc/netplan/02-netcfg.yml"

# Set dark theme:

bash -c "echo '[Settings]
gtk-application-prefer-dark-theme=1' >> ~/.config/gtk-3.0/settings.ini"

# Add additional repositories:

bash -c "echo 'deb http://archive.canonical.com/ubuntu focal partner' >> /etc/apt/sources.list"
bash -c "echo 'deb-src http://archive.canonical.com/ubuntu focal partner' >> /etc/apt/sources.list"
add-apt-repository ppa:lutris-team/lutris -y

# Update OS:

apt update
apt upgrade -y

# Install software:

apt install -y net-tools openssh-server python3-pip git openjdk-11-jdk ansible flatpak preload lutris

apt --fix-broken install

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install flathub io.atom.Atom -y
flatpak install flathub com.jetbrains.PyCharm-Community -y
flatpak install flathub com.jetbrains.IntelliJ-IDEA-Community -y
flatpak install flathub com.nextcloud.desktopclient.nextcloud -y
flatpak install flathub org.videolan.VLC -y

snap install chromium lxd docker postman

# Uninstall bundled software:

apt purge -y gnome-mines gnome-sudoku firefox thunderbird pidgin transmission-gtk xfburn parole
apt purge '^sgt-*' -y

apt autoremove -y

###############################################################
# This requires user interaction to accept a license agrement#
# Need to figure out how to automate this#
apt install -y ubuntu-restricted-extras
###############################################################
