#!/bin/sh -x

# install python package 'tldr.py', which can use offline tldr pages.
# (note: it is different from package 'tldr', which supports only online query.)

# install python package
sudo apt-get install python-yaml
pip install tldr.py --user

# install data (tldr pages)
force_update=0

[ -d ~/temp ] || mkdir ~/temp
cd ~/temp && [ -f tldr-pages-master.tar.gz ] || wget -c 'https://github.com/tldr-pages/tldr/archive/master.tar.gz' -O tldr-pages-master.tar.gz
[ -d ~/.tldr ] || (cd ~ && tar zxf ~/temp/tldr-pages-master.tar.gz && mv tldr-master .tldr)

# add configuration file
cat > ~/.tldrrc <<EOF
colors:
   command: cyan
   description: blue
   usage: green
platform: linux
repo_directory: ${HOME}/.tldr
EOF

[ -f ~/.local/bin/tldr ] && cd ~/.local/bin && ln -s ./tldr ./tldr.py

echo "If everything went smoothly, tldr executable should be installed to ~/.local/bin/tldr"
echo "and offline pages stored in ~/.tldr/pages".
