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
 
- [bashmarks](https://github.com/huyng/bashmarks ) Directory bookmarks for the shell
 
But what I'm using is [this fork](https://github.com/bachya/bashmarks ) which supports command_prefixes (e.g. use `bmg` rather than `g` to go to a bookmarked folder)
 
- [commacd](https://github.com/shyiko/commacd ).
 
Most often use case of mine is the one like zsh's `cd` command: `,, jekyll ghost` to change current directory from `~/github/jekyll/test` to `~/github/ghost/test`
 
- [cd](https://github.com/spencertipping/cd ): A better "cd" for bash
 
- [marker](https://github.com/pindexis/marker ): The terminal command palette
 
- [hr](https://github.com/LuRsT/hr ): Print a horizontal ruler for your terminal
 
- [hhighlighter](https://github.com/paoloantinori/hhighlighter ): A command line tool to highlight terms from input.


## zsh
 
- [k](https://github.com/supercrabtree/k )
 
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting )


## highlighter

- [grc](https://github.com/garabik/grc )

With some improvments from <https://github.com/iax71/grc/> .

- [colorex](https://github.com/Scopart/colorex/ ).


## grep & similar tools
 
- [ack 1.96](https://github.com/petdance/ack )
 
- [grin](https://pypi.python.org/pypi/grin/ )
 
- [sack](https://github.com/sampson-chen/sack )


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
 
And a fork supporting using current tmux session: https://github.com/SaaldjorMike/tmux-cssh
 
 
## command line translator
 
- [ydcv](https://github.com/felixonmars/ydcv/ )
