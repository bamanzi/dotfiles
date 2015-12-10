alias dir="ls --file-type --color"
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

alias rm="rm -i"
alias cp="cp -i"
alias mv="mv pi"

alias e=emacsclient

for f in ~/.bash/plugins/*.sh; do
  . $f
done
