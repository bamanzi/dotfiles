#!/bin/sh

VER=0.13.3
arch=`uname -m`
case $arch in
#  armv7*) bin_arch=android_arm7;;
  x86_64) bin_arch=linux_amd64;;
  i386|i586|i686)  bin_arch=linux_386;;
  *)
    print "no binary for arch '$arch'. fallback to ruby version"
    ln -s fzf.rb fzf
    exit 2
    ;;
esac

URL=https://github.com/junegunn/fzf-bin/releases

# find latest version number
VER=$(wget $URL -O - | grep 'css-trucate-target">' | awk -F '>' '{print $2}' | awk -F '<' '{print $1}' | grep ^[0-9] | head -1 )


[ -d ~/temp ] || mkdir ~/temp
(cd ~/temp && wget -c "${URL}/download/${VER}/fzf-${VER}-${bin_arch}.tgz" && tar zxvf fzf-${VER}-${bin_arch}.tgz )

[ -d ~/bin ] || mkdir ~/bin
cp -f ~/temp/fzf-${VER}-${bin_arch} ~/bin/fzf-${bin_arch}
cd ~/bin
[ -f fzf ] && mv fzf fzf.bak
ln -s fzf-${bin_arch} fzf
