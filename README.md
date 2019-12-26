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

### change directory

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


```
    $ cd ..5                    # cd's up five directories
    $ cd ..foo                  # cd's up to the nearest dir matching /foo/
 
    $ cd ^                      # history: go back one directory
    $ cd ^^                     # history: go back two directories
    $ cd ^10                    # history: go back ten directories
    $ cd -10                    # history: go back ten directories
    $ cd ^foo                   # history: go back to last dir matching /foo/

    $ cd x.tar                  # mounts x.tar with archivemount
```

- [enhancd](https://github.com/b4b4r07/enhancd ): A next-generation cd command with an interactive filter (requires [fzf])

  Note: I changed the trigger command to `fcd` (rather than default `cd`).

- (link)[bd](https://github.com/vigneshwaranr/bd ): Quickly go back to a parent directory in linux instead of typing `cd ../../../` repeatedly

  (No longer needed. `commacd` contains this feature (`,, par`).)


### command palette

- [marker](https://github.com/pindexis/marker ): The terminal command palette

  (I changed the keybinding, as both `Ctrl-k` and `Ctrl+space` are commonly used for other purposes.)

    - `Ctrl-o`: search for commands that match the current written string in the command-line.
    - `Ctrl-@` (or `marker add`): Bookmark a command.

- [keep](https://github.com/Orkohunter/keep ): Personal shell command keeper and snipper manager

### misc

- [hr](https://github.com/LuRsT/hr ): Print a horizontal ruler for your terminal
 
- [hhighlighter](https://github.com/paoloantinori/hhighlighter ): A command line tool to highlight terms from input.

```
	tail -F | h keyword1 keyword2

	mvn clean install | h -i failure success
```

## zsh

- [bashmarks](https://github.com/huyng/bashmarks ): Directory bookmarks for the shell (zsh port)

- [commacd](https://github.com/qfjp/tree/zsh ): zsh port of <https://github.com/shyiko/commacd>
 
- [k](https://github.com/supercrabtree/k )
 
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting )


## colorizer/highlighter

### colorize outputs of many programms

- [grc](https://github.com/garabik/grc )

```
    grc netstat
    grc ping hostname
    grc tail /var/log/syslog
    
    # or
    source ~/.bash/plugins/grc.sh
    ping hostname  	# aliased `ping`
    
    # grcat
    /usr/sbin/traceroute www.linux.org | grcat conf.traceroute
```

  Note: I got some configuration improvments from <https://github.com/iax71/grc/> .

- (link)[colorwrapper](http://cwrapper.sf.net) could colorize the outputs of 90+ different programs.

  Note: no document on its website. Visit https://bit.ly/2QKWfgO for an introduction.


### colorize outputs of a specific program

- [cdiff](https://github.com/ymattw/cdiff ): View colored, incremental diff in workspace or from stdin with side by side and auto pager support

- [colordiff](http://www.colordiff.org/ ): A wrapper for 'diff' and produces the same output but with pretty 'syntax' highlighting. 

- (link)[colorgcc](http://pkgs.org/download/colorgcc)

- (link)[colormake](http://bre.klaki.net/programs/colormake)

  And a python port: <https://github.com/dcjones/colormake>


### highlight one (or multiple) phrase given by user (similar to `grep -color foobar`)

- [colorex](https://github.com/Scopart/colorex/ )

```
    # to display every word "ERROR" in red of foo.txt, type:
    colorex --red ERROR foo.txt

    # to watch logfile.txt displaying "WARNING" in yellow and "INFO" in green:
    tail -f logfile.txt | colorex -y WARNING --green INFO
    exit with CTRL c
```

### View source code in color (syntax highlighting)

- `/usr/share/vim/vimcurrent/macros/less.sh`

- (link)[pygments](http://pygments.org )


## grep & similar tools

- articles:

    * [Feature comparison of ack, ag, git-grep GNU grep and ripgrep](https://beyondgrep.com/feature-comparison)

    * [Other grep-like tools](https://beyondgrep.com/more-tools): ag, pt, ripgrep, glark...


- [ack 1.96](https://github.com/petdance/ack )
 
- [grin](https://pypi.python.org/pypi/grin/ )
 
- [sack](https://github.com/sampson-chen/sack ): a faster way to use ag, ack (or grep)

- (link)[ag (the silver searcher)](https://github.com/ggree/the_silver_searcher)

```
    # Debian/Ubuntu
    apt install silversearcher-ag
    # RedHat (Fedora/RHEL/CentOS)
    yum install epel-release
    yum install the_silver_searcher
    # SuSE (openSuSE/SLE)
    zypper install the_silver_searcher
```

- (link)[ripgrep](https://github.com/BurnSushi/ripgrep)

```
    # Debian (currently sid only)
    apt install ripgrep
    # Fedora
    yum install ripgrep
    # others
    ./grep/bin/install-ripgrep-bin.sh
```

## fuzzy finder (fzf & peco ...)

see also: <https://www.cnblogs.com/bamanzi/p/cli-narrowing-tools.html>

- [fzf](https://github.com/junegunn/fzf ): A command-line fuzzy finder written in Go.

- [fzf-extras](https://github.com/atweiden/fzf-extras ): Additional key commands utilizing fzf, primarily for Bash.

- [peco](https://github.com/peco/peco )

- (link)[fzy](https://github.com/jhawthorn/fzy ): A better fuzzy finder (it has better match algorithm)


## tlder & cheat (for cheatsheet looking-up)
 
- [tldr.py](https://github.com/lord63/tldr.py ): A python client for [tldr](https://github.com/tldr-pages/tldr )

- [cheat](https://github.com/jahendrie/cheat ): A Bash reimplementation of [Chris Lane's cheat sheet script](https://github.com/chrisallenlane/cheat )

- (online)<http://cheat.sh>. For example: <http://cheat.sh/lsof>


## tmux & screen
 
- [.tmux](https://github.com/gpakosz/.tmux ): pretty + versatile self-contained tmux configuration

- [tmuxifier](https://github.com/jimeh/tmuxifier ): Powerful session, window & pane management for Tmux.
 
- [mucks](http://zserge.com/blog/mucks.html ): automating screen and tmux's session/window creation.

- [tmux-xpanes](https://github.com/greymd/tmux-xpanes ): Awesome tmux-based terminal divider

- [tmux-cssh](https://github.com/dennishafemann/tmux-cssh )
 
  And a fork supporting using current tmux session: <https://github.com/SaaldjorMike/tmux-cssh>

- [extrakto](https://github.com/laktak/extrakto): tmux plugin to extract strings from pane text for clipboard copy & output completions


## command line translator / dictionary
 
- [ydcv](https://github.com/felixonmars/ydcv/ ): YouDao Console Version

- [translate-shell](https://github.com/soimort/translate-shell/ )

  Translate Shell (formerly `Google Translate CLI`) is a command-line translator powered by /Google Translate (default), Bing Translator, Yandex.Translate/ and /Apertium/. It gives you easy access to one of these translation engines your terminal.

```
    $ trans -brief 'Saluton, Mondo!'
    Hello, World!
    
    $ trans zh: 瓷器
    
    $ trans -e bing :zh hello
``` 

More similar tools:

- [zdict](https://github.com/zdict/zdict ): a dictionary app for Yahoo Dictionary, Moe Dictionary, Wiktionary etc (`pip3 install zdict`)
- [vocabs](https://github.com/Mckinsey666/vocabs ): a online dictionary CLI (`pip3 install vocabs`)
- [define](https://github.com/Rican7/define ): a dictionary app supporting Merriam-Webster & Oxford Dictionary (API key required)

## misc

- [climate](https://github.com/adtac/climate ):  Provides a huge number of tools for developers to automate their system
