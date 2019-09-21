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

# Cloning some repositories
cd ~
mkdir git
cd git
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'
git config --global user.email "kevin@kelaun.be"
git config --global user.name "Kevin Andriessens"
git clone https://github.com/kelaun/dotfiles.git

# Adding dotfiles to correct locations
cd ~
rm -rf .bashrc
ln -s /home/$(whoami)/git/dotfiles/.bashrc /home/$(whoami)/.bashrc

# Adding some cleaning software
cd ~/git
git clone https://github.com/Esclapion/packsize.git
cd packsize
make
yay -S package-query
cd ~/git
git clone https://aur.archlinux.org/yaourt.git
cd yaourt
makepkg -si
