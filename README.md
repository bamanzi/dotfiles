My dotfiles and collection of small utils.
 
With most subfolders, you can use [GNU stow](https://www.gnu.org/software/stow ) or [xstow](http://xstow.sourceforge.net/ ) to link them to your home folder.

```
	cd ~/dotfiles/tmux
	xstow -v tmux
	## this would create the following links
	# ~/.tmux.conf -> ~/dotfiles/tmux/.tmux.conf
	# ~/.tmux.conf.local -> ~/dotfiles/tmux/.tmux.conf.local
	# ~/.bash/plugins/tmuxifier.sh
	# ~/.tmuxifier -> ~/dotfiles/tmux/.tmuxifier
```
 
## bash
 
- [bashmarks](https://github.com/huyng/bashmarks ): Directory bookmarks for the shell
 
But what I'm using is [this fork](https://github.com/bachya/bashmarks ) which supports command_prefixes (e.g. use `bmg` rather than `g` to go to a bookmarked folder)

    bml                 - Lists all available bookmarks
    bms <bookmark_name> - Saves the current directory as "bookmark_name"
    bmg <bookmark_name> - Goes (cd) to the directory associated with "bookmark_name"
    bmp <bookmark_name> - Prints the directory associated with "bookmark_name"
    bmd <bookmark_name> - Deletes the bookmark

- [commacd](https://github.com/shyiko/commacd ).
 
Most often use case of mine is the one like zsh's `cd` command: `,, jekyll ghost` to change current directory from `~/github/jekyll/test` to `~/github/ghost/test`
 
- [cd](https://github.com/spencertipping/cd ): A better "cd" for bash

    $ cd ..5                    # cd's up five directories
    $ cd ..foo                  # cd's up to the nearest dir matching /foo/
 
    $ cd ^                      # history: go back one directory
    $ cd ^^                     # history: go back two directories
    $ cd ^10                    # history: go back ten directories
    $ cd -10                    # history: go back ten directories
    $ cd ^foo                   # history: go back to last dir matching /foo/

    $ cd x.tar                  # mounts x.tar with archivemount

- [marker](https://github.com/pindexis/marker ): The terminal command palette

(I changed the keybinding, as both `Ctrl-k` and `Ctrl+space` are commonly used for other purposes.)

    - `Ctrl-o`: search for commands that match the current written string in the command-line.
    - `Ctrl-@` (or `marker add`): Bookmark a command.
 
- [hr](https://github.com/LuRsT/hr ): Print a horizontal ruler for your terminal
 
- [hhighlighter](https://github.com/paoloantinori/hhighlighter ): A command line tool to highlight terms from input.

	tail -F | h keyword1 keyword2

	mvn clean install | h -i failure success


## zsh

- [bashmarks](https://github.com/huyng/bashmarks ): Directory bookmarks for the shell
 
- [k](https://github.com/supercrabtree/k )
 
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting )


## highlighter

- [grc](https://github.com/garabik/grc )

With some improvments from <https://github.com/iax71/grc/> .

    grc netstat
    grc ping hostname
    grc tail /var/log/syslog
    
    # or
    source ~/.bash/plugins/grc.sh
    ping hostname  	# aliased `ping`
    
    # grcat
    /usr/sbin/traceroute www.linux.org | grcat conf.traceroute

- [colorex](https://github.com/Scopart/colorex/ ).

- [hhighlighter](http://github.com/paoloantinori/

    tail -F | h keyword1 keyword2
    mvn clean install | h -i failure success

- [highlighter]: see above.


## grep & similar tools
 
- [ack 1.96](https://github.com/petdance/ack )
 
- [grin](https://pypi.python.org/pypi/grin/ )
 
- [sack](https://github.com/sampson-chen/sack ): sack, sgrep & sag


## fzf & peco

- [fzf](https://github.com/junegunn/fzf ): A command-line fuzzy finder written in Go.

- [fzf-extras](https://github.com/atweiden/fzf-extras ): Additional key commands utilizing fzf, primarily for Bash.

- [enhancd](https://github.com/b4b4r07/enhancd ): A next-generation cd command with an interactive filter

Note: I changed the trigger command to `fcd` (rather than default `cd`).

- [peco](https://github.com/peco/peco )


## tlder & cheat
 
- [tldr.py](https://github.com/lord63/tldr.py ): A python client for [tldr](https://github.com/tldr-pages/tldr )

- [cheat](https://github.com/jahendrie/cheat ): A Bash reimplementation of [Chris Lane's cheat sheet script](https://github.com/chrisallenlane/cheat )


## tmux & screen
 
- [.tmux](https://github.com/gpakosz/.tmux ): pretty + versatile self-contained tmux configuration

- [tmuxifier](https://github.com/jimeh/tmuxifier ): Powerful session, window & pane management for Tmux.
 
- [mucks](http://zserge.com/blog/mucks.html ): automating screen and tmux's session/window creation.
 
- [tmux-cssh](https://github.com/dennishafemann/tmux-cssh )
 
And a fork supporting using current tmux session: <https://github.com/SaaldjorMike/tmux-cssh>


## command line translator
 
- [ydcv](https://github.com/felixonmars/ydcv/ ): YouDao Console Version

- [translate-shell](https://github.com/soimort/translate-shell/ )

Translate Shell (formerly Google Translate CLI) is a command-line translator powered by /Google Translate (default), Bing Translator, Yandex.Translate/ and /Apertium/. It gives you easy access to one of these translation engines your terminal.

    $ trans -brief 'Saluton, Mondo!'
    Hello, World!
    
    $ trans zh: 瓷器
    
    $ trans -e bing :zh hello
    

## misc

- [cdiff](https://github.com/ymattw/cdiff ): View colored, incremental diff in workspace or from stdin with side by side and auto pager support
- [colordiff](http://www.colordiff.org/ ): A wrapper for 'diff' and produces the same output but with pretty 'syntax' highlighting. 
