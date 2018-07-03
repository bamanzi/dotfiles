#!/bin/sh

# Download latest deb packages of Double Commander from Debian
# repository, and make it a portable application.

# The main purpose of this script is to surpress the dependency
# complains of dpkg, while http://sf.net/projects/doublecmd/files
# didn't provide a portable tarball for Raspberry Pi (armel).

set -e

[ -d ~/bin ] || mkdir ~/bin

arch=`uname -m`
case $arch in
  armv7*)           bin_arch=armel;;
  x86_64)           bin_arch=amd64;;
  i386|i586|i686)  bin_arch=linux_386;;
  *)
    print "no binary for arch '$arch'. fallback to ruby version"
    cd ~/bin && ln -s fzf.rb fzf
    exit 2
    ;;
esac

do_download() {
  for pkg in ${bin_arch}/doublecmd-gtk ${bin_arch}/doublecmd-plugins all/doublecmd-common; do
    page=https://packages.debian.org/sid/${pkg}/download
    deb_url=$(wget $page -O - | grep 'ftp.cn' | cut -d'"' -f 2)
    
    wget -c $deb_url
  done
}

do_unpack() {
  [ -d DoubleCmd ] && mv -f DoubleCmd DoubleCmd.old
  dpkg-deb -X doublecmd-gtk_*.deb      DoubleCmd
  dpkg-deb -X doublecmd-plugins_*.deb DoubleCmd
  dpkg-deb -X doublecmd-common_*.deb  DoubleCmd
}

do_move() {
  cd DoubleCmd
  mv usr/lib/doublecmd/* .
  
  # remove broken symlinks
  rm -f language
  rm -f pixmaps
  rm -f doc
  rm -f highlighters
  
  mv usr/share/doublecmd/* .
  
  mv usr/share/pixmaps/doublecmd.png .
  cp -f pixmaps/mainicon/alt/dcfinal.svg doublecmd.svg
  
  mv usr/share/applications/doublecmd.desktop .
  
  mkdir doc
  zcat usr/share/man/man1/doublecmd.1.gz > doc/doublecmd.1
  zcat usr/share/doc/doublecmd-gtk/changelog.gz > doc/changelog
  cp   usr/share/doc/doublecmd-gtk/copyright doc/
}

do_download
do_unpack
do_move

