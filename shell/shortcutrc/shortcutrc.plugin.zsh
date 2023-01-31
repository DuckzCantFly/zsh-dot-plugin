### Shortcut RC ###

# Quick CD
alias \
	h="cd $HOME/ && ls -a" \
	d="cf $HOME/doc" \
	n="$EDITOR $MGH/notes/index.md" \
	D="cf $HOME/dl" \
	s="cf $HOME/doc/school" \
	b="cf $HOME/doc/books" \
	mu="cf $HOME/doc/media/mu" \
	img="cf $HOME/doc/media/img" \
	vid="cf $HOME/doc/media/vid" \
	gh="cf $GH" \
	mgh="cf $MGH" \
	gp="cf $GOPATH" \
	lc="cf $HOME/.local" \
	ltn="cf $HOME/doc/media/books/ln"

# Configuration
alias \
	cfv="$EDITOR $XDG_CONFIG_HOME/nvim/" \
	cfz="$EDITOR $ZPLUGINDIR/zsh-dot-plugin/" \
	cfa="$EDITOR $XDG_CONFIG_HOME/shell/aliasrc" \
	cfs="$EDITOR $XDG_CONFIG_HOME/shell/shortcutrc" \
	cfkb="$EDITOR $XDG_CONFIG_HOME/keyboards/" \
	bw="$EDITOR $XDG_CONFIG_HOME/bookmarks" \
	cfc="$EDITOR $XDG_DATA_HOME/calcurse/apts" \
	cfm="$EDITOR $XDG_CONFIG_HOME/mutt/muttrc" \
	cfd="$EDITOR $HOME/.Xdefaults" \
	cfu="$EDITOR $XDG_CONFIG_HOME/newsboat/urls" \
	cfn="$EDITOR $XDG_CONFIG_HOME/newsboat/config" \
	cfmb="$EDITOR $XDG_CONFIG_HOME/ncmpcpp/bindings" \
	cfmc="$EDITOR $XDG_CONFIG_HOME/ncmpcpp/config" \
	cfdc="dconf dump / >$XDG_CONFIG_HOME/dconf/user.conf \
		&& $EDITOR -c 'setf dosini' $XDG_CONFIG_HOME/dconf/user.conf \
		&& dconf load / <$XDG_CONFIG_HOME/dconf/user.conf" \

	# cfkb="cd /home/dwm/qmk_firmware/keyboards/preonic/keymaps/duckzcantfly && $EDITOR keymap.c" \
