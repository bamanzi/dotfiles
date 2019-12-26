#set -g default-shell '/bin/zsh'
#set -g default-terminal "screen-256color"

set -g mouse on

# join last active pane to current window
# http://unix.stackexchange.com/a/46356
bind j join-pane -s !

# let other pane jump to the same directory
bind C-o send-key -t :.+ "cd $PWD" C-m

# new window/pane in current directory
# (option `default-path` no longer in tmux-1.9+)
bind-key c   new-window      -c '#{pane_current_path}'
bind-key '"' split-window    -c '#{pane_current_path}'
bind-key %   split-window -h -c '#{pane_current_path}'

