#!/bin/sh

PRJNAME=peco
EXE=peco
URL=https://github.com/peco/peco/releases

VER=v0.5.3
os_n_arch=$(uname -o)-$(uname -m)
case $os_n_arch in
  GNU/Linux-armv7*) bin_arch=linux_arm;   pack=tar.gz;;
  GNU/Linux-x86_64) bin_arch=linux_amd64; pack=tar.gz;;
  GNU/Linux-i*86)   bin_arch=linux_386;   pack=tar.gz;;
  Msys-i686)        bin_arch=windows_386; pack=zip;;
  *) print "no binary for os/arch '$os_n_arch'."; exit -1;;
esac


if [ "foo$bin_arch" = "foolinux_arm" ]; then
  # maybe there's no ARM verion pre-built binary for the latest version 
  VER=v0.5.3
else
  # find latest version number
  VER=$(wget $URL -O - | grep 'releases/tag/v' | awk -F '>' '{print $2}' | awk -F '<' '{print $1}' | grep '^v[0-9]' | head -1 )
fi

if [ -x ~/bin/${EXE} ]; then
  ( ~/bin/${EXE} --version 2>&1 | grep $VER ) && echo "You already have latest version." && exit 0
fi

[ -d ~/temp ] || mkdir ~/temp
(cd ~/temp && wget -c "${URL}/download/${VER}/${PRJNAME}_${bin_arch}.${pack}" -O ${PRJNAME}_${bin_arch}-${VER}.${pack} && (tar xvf ${PRJNAME}_${bin_arch}-${VER}.tar.gz || unzip ${PRJNAME}_${bin_arch}.zip))

[ -d ~/bin ] || mkdir ~/bin
cp -f ~/temp/${EXE}_${bin_arch}/${EXE} ~/bin
