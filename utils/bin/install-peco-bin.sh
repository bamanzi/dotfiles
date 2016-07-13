#!/bin/sh

# https://github.com/peco/peco/releases

VER=0.3.6
os_n_arch=$(uname -o)-$(uname -m)
case $os_n_arch in
  GNU/Linux-armv7*) bin_arch=linux_arm;   arch=tar.gz;;
  GNU/Linux-x86_64) bin_arch=linux_amd64; arch=tar.gz;;
  GNU/Linux-i*86)   bin_arch=linux_386;   arch=tar.gz;;
  Msys-i686)        bin_arch=windows_386; arch=zip;;
  *) print "no binary for os/arch '$os_n_arch'."; exit -1;;
esac

[ -d ~/temp ] || mkdir ~/temp
(cd ~/temp && wget -c "https://github.com/peco/peco/releases/download/v${VER}/peco_${bin_arch}.${arch}" && (tar xvf peco_${bin_arch}.tar.gz || unzip peco_${bin_arch}.zip))

cp -f ~/temp/peco_${bin_arch}/peco .
