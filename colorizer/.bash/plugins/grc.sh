GRC=`which grc`
if [ "$TERM" != dumb ] && [ -n "$GRC" ]
then
    alias colourify="$GRC -es --colour=auto"


    alias env='colourify env'
    alias diff='colourify diff'
    alias ls='colourify ls --color'
    alias head='colourify head'
    alias tail='colourify tail'

    alias docker='colourify docker'
    alias docker-machine='colourify docker-machine'

    alias df='colourify df'
    alias du='colourify du'
    alias free='colourify free'
    alias iostat='colourify iostat'
    alias mount='colourify mount'
    alias ps='colourify ps'
    alias vmstat='colourify vmstat'

    alias as='colourify as'
    alias gas='colourify gas'
    alias configure='colourify ./configure'
    alias gcc='colourify gcc'
    alias g++='colourify g++'
    alias ld='colourify ld'
    alias make='colourify make'

    alias dig='colourify dig'
    alias ifconfig='colourify ifconfig'
    alias ip='colourify ip'
    alias iptables='colourify iptables'
    alias mtr='colourify mtr'
    alias nmap='colourify nmap'
    alias netstat='colourify netstat'
    alias ping='colourify ping'
    alias ss='colourify ss'
    alias tcpdump='colourify tcpdump'
    alias traceroute='colourify /usr/sbin/traceroute'

    alias blkid='colourify blkid'
    alias lsblk='colourify lsblk'
    alias lspci='colourify lspci'

    alias semanage='colourify semanage'
    alias getsebool='colourify setsebool'
fi
