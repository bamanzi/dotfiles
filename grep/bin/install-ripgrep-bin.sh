#!/bin/sh

PRJNAME=ripgrep

os_n_arch=$(uname -o)-$(uname -m)
case $os_n_arch in
  GNU/Linux-armv7*) bin_arch=arm-unknown-linux-gnueabihf;  pack=tar.gz;;
  GNU/Linux-x86_64) bin_arch=x86_64-unknown-linux-musl;   pack=tar.gz;;
  GNU/Linux-i*86)   bin_arch=i686-unknown-linux-musl;    pack=tar.gz;;
  Msys-i686)        bin_arch=i686-pc-windows-gnu;       pack=zip;;
  *) print "no binary for os/arch '$os_n_arch'."; exit -1;;
esac

URL=https://github.com/BurntSushi/ripgrep/releases

# find latest version number
VER=$(wget $URL -O - | grep 'releases/tag/' | awk -F '>' '{print $2}' | awk -F '<' '{print $1}' | grep '^[0-9]' | head -1 )


if [ -x ~/bin/rg ]; then
  ( ~/bin/rg --version 2>&1 | grep $VER ) && echo "You already have latest version." && exit 0
fi

[ -d ~/temp ] || mkdir ~/temp
(cd ~/temp && wget -c "${URL}/download/${VER}/${PRJNAME}-${VER}-${bin_arch}.${pack}" -O ${PRJNAME}-${VER}-${bin_arch}.${pack} &&
     (tar xvf ${PRJNAME}-${VER}-${bin_arch}.tar.gz || unzip ${PRJNAME}-${VER}-${bin_arch}.zip))

[ -d ~/bin ] || mkdir ~/bin
cp -f ~/temp/${PRJNAME}-${VER}-${bin_arch}/rg ~/bin
