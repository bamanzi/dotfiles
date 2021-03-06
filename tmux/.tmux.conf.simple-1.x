#set -g default-shell '/bin/zsh'
#set -g default-terminal "screen-256color"

setw -g mode-mouse on
setw -g mouse-select-window on
setw -g mouse-select-pane on
setw -g mouse-resize-pane on

# join last active pane to current window
# http://unix.stackexchange.com/a/46356
bind j join-pane -s !

# let other pane jump to the same directory
bind C-o send-key -t :.+ "cd $PWD" C-m
