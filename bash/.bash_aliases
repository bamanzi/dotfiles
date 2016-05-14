alias dir="ls --file-type --color"
alias ll='ls -l'
alias la='ls -A'
#alias l='ls -CF' #conflict with bashmarks
alias ls-l="ls -l"

alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

alias ..="cd .."
alias cd..="cd .."
alias ...="cd ../.."

alias e=emacsclient
alias vi=vim

echo $PATH | grep -q "$HOME/bin" && export PATH=~/bin:$PATH
echo $PATH | grep -q "$HOME/.local/bin" && export PATH=~/.local/bin:$PATH

for f in ~/.bash/plugins/*.sh; do
  . $f
done
