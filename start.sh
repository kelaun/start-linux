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
sudo rm -rf /etc/default/grub
sudo ln -s /home/$(whoami)/git/dotfiles/grub/grub /etc/default/grub
ln -s /home/$(whoami)/git/dotfiles/.xinitrc /home/$(whoami)/.xinitrc

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

# Cleaning up package list
sudo pacman -R noto-fonts-cjk firefox opendesktop-fonts gtop ttf-dejavu mc ttf-croscore xfce4-weather-plugin ttf-liberation transmission-gtk ttf-opensans ttf-carlito xfce4-clipman-plugin xfce4-mailwatch-plugin ipw2100-fw ttf-bitstream-vera ipw2200-fw xfce4-notes-plugin xfce4-battery-plugin neofetch ttf-caladea xfce4-diskperf-plugin xfce4-cpufreq-plugin xfce4-netload-plugin xfce4-timer-plugin xfce4-time-out-plugin xfce4-cpugraph-plugin xfce4-eyes-plugin boost nodejs doxygen glances irssi parole xfce4-xkb-plugin xfburn linux-atm flex s-nail kalu partimage xfce4-sensors-plugin expect leafpad xfce4-verve-plugin xfce4-systemload-plugin xfce4-genmon-plugin xfce4-smartbookmark-plugin welcome mozilla-common boost-libs partclone xfce4-mount-plugin xfce4-fsguard-plugin c-ares libburn libisofs libotr libunique libuv mailcap progsreiserfs python-future python-psutil qrencode xorg-font-utils xorg-fonts-encodings xorg-xdpyinfo libdmx libxxf86dga xorg-bdftopcf xorg-font-util xorg-mkfontscale arc-x-icons-theme arc-gtk-theme broadcom-wl-dkms capitaine-cursors ttf-ubuntu-font-family mousepad galculator b43-fwcutter gtksourceview3 paper-icon-theme gst-plugins-bad grub2-theme-endeavouros xfce4-dict gspell gst-plugins-ugly xf86-video-ati gtk-engine-murrine xf86-video-amdgpu wvdial grml-zsh-config zsh amd-ucode a52dec chromaprint faac faad2 libbs2b libdc1394 libdca libdvdnav libfdk-aac libgme liblrdf libmms libmpcdec libmpeg2 libnice libofa libsidplay libsrtp mjpegtools neon openal soundtouch spandsp srt wildmidi wvstreams zbar zvbi gupnp-igd libdvdread libmp4v2 xplc gupnp gssdp gst-plugins-good nano aalib libcaca libdv libshout mpg123 twolame wavpack imlib2 libid3tag

# Installing VLC
yay -S vlc

# Installing icon theme
yay -S ubuntu-themes

# Installing wal
yay -S python-pywal
