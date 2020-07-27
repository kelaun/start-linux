########################################
# Author:        Kevin Andriessens     #
# Creation date: 12th of October 2019  #
# Last modified: 27th of July 2020     #
# Version:       1.0                   #
########################################

## Updating the system
sudo apt update && sudo apt upgrade && sudo apt dist-upgrade

## Installing puppet
sudo apt install puppet

## Cloning puppet repo
su -c "cd /etc; rm -rf puppet; git clone https://github.com/kelaun/puppet.git;"
