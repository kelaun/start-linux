########################################
# Author:        Kevin Andriessens     #
# Creation date: 12th of October 2019  #
# Last modified: 19th of August 2020   #
# Version:       2.0                   #
########################################

## Updating the system
sudo pacman -Syyuu

## Installing puppet
yay -S puppet pdk

## Cloning puppet repo
su -c "cd /etc; rm -rf puppet; git clone https://github.com/kelaun/puppet.git;"
