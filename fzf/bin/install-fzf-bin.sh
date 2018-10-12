#!/bin/sh

PRJNAME=fzf
EXE=fzf
URL=https://github.com/junegunn/fzf-bin/releases

set -e

[ -d ~/bin ] || mkdir ~/bin

arch=`uname -m`
case $arch in
  armv7*) bin_arch=linux_arm7;;
  armv8*) bin_arch=linux_arm8;;
  x86_64) bin_arch=linux_amd64;;
  i386|i586|i686)  bin_arch=linux_386;;
  *)
    print "no binary for arch '$arch'. fallback to ruby version"
    cd ~/bin && ln -s fzf.rb fzf
    exit 2
    ;;
esac


# find latest version number
VER=$(wget $URL -O - | grep 'css-truncate-target">' | awk -F '>' '{print $2}' | awk -F '<' '{print $1}' | grep ^[0-9] | head -1 )
[ -z "$VER" ] && VER=0.15.4

[ -d ~/temp ] || mkdir ~/temp
(cd ~/temp && wget -c "${URL}/download/${VER}/${PRJNAME}-${VER}-${bin_arch}.tgz" && tar zxvf ${PRJNAME}-${VER}-${bin_arch}.tgz )
cp -f ~/temp/${PRJNAME}-${VER}-${bin_arch} ~/bin/${EXE}-${bin_arch}

cd ~/bin
[ -f ${EXE} ] && mv ${EXE} ${EXE}.bak
ln -s ${EXE}-${bin_arch} ${EXE}
