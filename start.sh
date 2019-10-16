#######################################
# Author:        Kevin Andriessens    #
# Creation date: 12th of October 2019 #
# Last modified: 12th of October 2019 #
# Version:       0.1                  #
#######################################

## Updating the system
sudo dnf update

## Installing puppet
sudo dnf install puppet

## Installing pdk
sudo rpm -Uvh https://yum.puppet.com/puppet-tools-release-fedora-30.noarch.rpm
sudo dnf install pdk
