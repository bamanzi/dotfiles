#!/bin/sh

VER=0.12.1
arch=`uname -m`
case $arch in
#  armv7*) bin_arch=android_arm7;;
  x86_64) bin_arch=linux_amd64;;
  i386|i586|i686)  bin_arch=linux_386;;
  *) print "no binary for arch '$arch'."; exit -1;;
esac

[ -d ~/temp ] || mkdir ~/temp
(cd ~/temp && wget -c "https://github.com/junegunn/fzf-bin/releases/download/${VER}/fzf-${VER}-${bin_arch}.tgz" && tar zxvf fzf-${VER}-${bin_arch}.tgz )

cp -f ~/temp/fzf-${VER}-${bin_arch} fzf-${bin_arch}
ln -s fzf-${bin_arch} fzf
