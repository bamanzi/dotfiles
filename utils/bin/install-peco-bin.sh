#!/bin/sh

# https://github.com/peco/peco/releases

VER=0.3.5
os_n_arch=$(uname -o)-$(uname -m)
case $os_n_arch in
  GNU/Linux-armv7*) bin_arch=linux_arm;;
  GNU/Linux-x86_64) bin_arch=linux_amd64;;
  GNU/Linux-i*86)   bin_arch=linux_386;;
  Msys-i686)        bin_arch=windows_386;;
  *) print "no binary for os/arch '$os_n_arch'."; exit -1;;
esac

[ -d ~/temp ] || mkdir ~/temp
(cd ~/temp && wget -c "https://https://github.com/peco/peco/releases/download/${VER}/peco_${VER}_${bin_arch}.zip" && unzip peco_${VER}_${bin_arch}.zip)

cp -f ~/temp/peco_${VER}_${bin_arch}/peco .
