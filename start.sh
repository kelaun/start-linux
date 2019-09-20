###################################
# Author:  Kevin Andriessens      #
# Version: 20th of September 2019 #
# Version: 0.1                    #
###################################

# /!\
## Do note this script is to be run after installing using the EndeavourOS ISO

# Updating the repository database
sudo pacman -Syy

# Upgrading the system
sudo pacman -Syu

# Installing nvidia
sudo pacman -S nvidia-installer
nvidia-installer-update-db
nvidia-installer -t
## Checking if a driver can be found
read -n 1 -p "Was there an error? (Y)es or (N)o" nvidiaError
## Installing if OK
if [ $nvidiaError == "N" ]; then
	sudo nvidia-installer
fi

# Installing spotify
gpg --keyserver hkp://ipv4.pool.sks-keyservers.net --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
gpg --keyserver hkp://ipv4.pool.sks-keyservers.net --recv-keys 2EBF997C15BDA244B6EBF5D84773BD5E130D1D45
yay -S spotify

# Installing brave browser
yay -S brave-bin

# Installing darktable
sudo pacman -S darktable

# Installing gimp
sudo pacman -S gimp

# Installing teamviewer
yay -S teamviewer
sudo systemctl enable teamviewerd.service
sudo systemctl start teamviewerd.service
