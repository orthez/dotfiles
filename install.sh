#!/bin/bash

ubuntu_version=`lsb_release -rs | sed 's/\.//'`
if [ $ubuntu_version == "1404" ];then
  echo "Install script Ubuntu 14.04"
else
  echo "This install script is for Ubuntu 14.04"
  echo "but version is $ubuntu_version"
  return 0
fi

echo "Installing the bare essentials..."
sudo apt-get install -qq vim cmake mplayer vlc apvlv htop
xdg-mime default apvlv.desktop image/vnd.djvu
xdg-mime default apvlv.desktop application/pdf

sudo apt-get install -qq nautilus-dropbox
dropbox start
sudo apt-get install -qq octave 
sudo apt-get install -qq ipython
sudo apt-get install -qq doxygen
################################################################
cp -Rp .* ~
cd ~
################################################################
echo "Installing XMONAD..."
sudo cp ~/.xmonad/gnome-xmonad.desktop /usr/share/xsessions/gnome-xmonad.desktop
sudo cp ~/.xmonad/xmonad.session /usr/share/gnome-session/sessions/xmonad.session
echo "Installing BASHRC script in root directory..."
sudo cp -p ~/.bashrc /root
sudo mkdir /root/.bash
sudo cp -p ~/.bash/apt_tab_completion /root/.bash
mkdir -p .vim/bundle/
################################################################
mkdir -p ~/git/
cd ~/git
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

sudo apt-get install -qq vlc htop nautilus-open-terminal curl libmp3lame0 \
cmake-curses-gui silversearcher-ag youtube-dl xmonad libghc-xmonad-dev \
libghc-xmonad-contrib-dev xmobar xcompmgr nitrogen stalonetray moreutils \
consolekit ssh-askpass-gnome thunar terminator remmina gnome-panel \
xclip \
libc-ares2 libcrypto++-dev libcrypto++9 \
gimp inkscape libssl-dev openssl libx11-dev \
etoolbox python-pip gfortran \
exuberant-ctags \
python-matplotlib python-pip 
################################################################
echo "Installing Essential Python packages"
sudo pip install networkx
sudo pip install cvxpy
sudo pip install trimesh
echo 'import numpy as np' >> $(ipython locate profile default)/startup/00_imports.py
echo 'import matplotlib.pyplot as plt' >> $(ipython locate profile default)/startup/00_imports.py

#echo "disabling keypad"
#echo "run xinput list; xinput set-prop 12 "Device Enabled" 0"

echo "Installing LATEX essentials"
sudo apt-get install -qq texlive-full 

echo "Displaying date in time indicator"
gsettings set com.canonical.indicator.datetime show-clock true
gsettings set com.canonical.indicator.datetime show-day true
gsettings set com.canonical.indicator.datetime show-date true


cd ~/Downloads
wget https://mega.nz/linux/MEGAsync/xUbuntu_14.04/amd64/megasync-xUbuntu_14.04_amd64.deb
sudo dpkg -i megasync-xUbuntu_14.04_amd64.deb
megasync

echo "FIREFOX: install vimperator | noscript | adblockplus"

#sudo apt-get install doxygen libode-dev libtinyxml-dev libassimp-dev libglpk-dev
#libglui-dev mesa-utils freeglut3-dev libboost-all-dev qt4-qmake

sudo apt-get install libboost1.55-dev 
sudo apt-get install -qq libboost1.55-all-dev
sudo apt-get install -qq libboost1.55-tools-dev


sudo apt-get install -qq g++ cmake git libboost-dev libboost-system-dev libboost-thread-dev freeglut3 freeglut3-dev libglpk-dev python-dev python-opengl libxmu-dev libxi-dev libqt4-dev
sudo apt-get install -qq libassimp-dev
sudo apt-get install -qq blender
sudo apt-get install -qq libcgal-dev 
sudo apt-get install -qq libeigen3-dev
sudo apt-get install -qq liburdfdom-tools #urdf2pdf
#git clone https://github.com/orthez/orthoklampt
sudo apt-get install -qq libflann-dev

sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
sudo apt-get update
sudo apt-get install -qq gcc-5 g++-5
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 60 --slave /usr/bin/g++ g++ /usr/bin/g++-5

### to be automated
### thunderbird -> muttator and autoscript
### firefox ->vimperator
### git clone git@github.com:vimperator/vimperator-labs.git
#echo "Make OMPL"
#cd ~/Downloads
#wget http://ompl.kavrakilab.org/install-ompl-ubuntu.sh
#./install-ompl-ubuntu.sh --app
#cd ~/git/
#git clone https://github.com/orthez/Klampt
#cd Klampt/Library; make unpack-deps; make deps


echo "Starting firefox about:config"
echo "please change the following entry:"
echo "xpinstall.signatures.required;false"
firefox about:config


echo "End of Install Script"
echo "Logout and LOGIN to Gnome with XMONAD"
