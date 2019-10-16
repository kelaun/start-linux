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

## Cloning git puppet db
su -c "rm -rf /etc/puppet; cd /etc/; git clone https://github.com/kelaun/puppet"
#/!\ Keep in mind you'll need to start a new branch to adapt the code where needed /!\
