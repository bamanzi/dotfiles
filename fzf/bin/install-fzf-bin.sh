#!/bin/sh

PRJNAME=fzf
EXE=fzf
BASEURL=https://github.com/junegunn/fzf-bin/releases

set -e

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

if which fzf; then
  echo "Existing version: $(which fzf): $(fzf --version 2>&1)"
  ( fzf --version | grep $VER ) && echo "You already have latest version." && exit 0
fi  

#use `VER=0.15.4 install-fzf-bin.sh` to install specific version
if [ -z "$VER" ]; then
  # find latest version number
  VER=$(wget $BASEURL -O - | grep 'css-truncate-target"' | awk -F '>' '{print $2}' | awk -F '<' '{print $1}' | grep ^[0-9] | head -1 )
  [ -z "$VER" ] && VER=0.15.4
fi

URL="${BASEURL}/download/${VER}/${PRJNAME}-${VER}-${bin_arch}.tgz"
echo "About to download & install $URL"  && echo "continue?" && read a

[ -d ~/temp ] || mkdir ~/temp
(cd ~/temp && wget -c "$URL" && tar zxvf ${PRJNAME}-${VER}-${bin_arch}.tgz )
cp -f ~/temp/${PRJNAME}-${VER}-${bin_arch} ~/bin/${EXE}-${bin_arch}

[ -d ~/bin ] || mkdir ~/bin
cd ~/bin
[ -f ${EXE} ] && mv ${EXE} ${EXE}.bak
ln -s ${EXE}-${bin_arch} ${EXE}
