########################################
# Author:        Kevin Andriessens     #
# Creation date: 12th of October 2019  #
# Last modified: 03rd of February 2020 #
# Version:       1.0                   #
########################################

## Setting up the mirrorlist
sudo pacman-mirrors -a -P https

## Updating the system
sudo pacman -Syyuu

## Installing puppet
yay -S puppet

## Cloning puppet repo
su -c "cd /etc; rm -rf puppet; git clone https://github.com/kelaun/puppet.git;"

## Updating to pulseaudio
install_pulse
