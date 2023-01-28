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
	ltn="cf $HOME/doc/media/books/ln" \

# Configuration
alias \
	bw="$EDITOR $XDG_CONFIG_HOME/bookmarks" \
	cfa="$EDITOR $XDG_CONFIG_HOME/zsh/plugins/zsh-config-as-plugin/shell/aliasrc/aliasrc.plugin.zsh" \
	cfs="$EDITOR $XDG_CONFIG_HOME/zsh/plugins/zsh-config-as-plugin/shell/shortcutrc/shortcutrc.plugin.zsh" \
	cfkb="cd /home/dwm/qmk_firmware/keyboards/preonic/keymaps/duckzcantfly && $EDITOR keymap.c" \
	cfz="$EDITOR $ZPLUGINDIR/zsh-dot-plugin" \
	cfc="$EDITOR $XDG_DATA_HOME/calcurse/apts" \
	cfv="$EDITOR $XDG_CONFIG_HOME/nvim" \
	cfm="$EDITOR $XDG_CONFIG_HOME/mutt/muttrc" \
	cfd="$EDITOR $HOME/.Xdefaults" \
	cfu="$EDITOR $XDG_CONFIG_HOME/newsboat/urls" \
	cfn="$EDITOR $XDG_CONFIG_HOME/newsboat/config" \
	cfmb="$EDITOR $XDG_CONFIG_HOME/ncmpcpp/bindings" \
	cfmc="$EDITOR $XDG_CONFIG_HOME/ncmpcpp/config" \
	cfdc="dconf dump / >$XDG_CONFIG_HOME/dconf/user.conf \
		&& $EDITOR -c 'setf dosini' $XDG_CONFIG_HOME/dconf/user.conf \
		&& dconf load / <$XDG_CONFIG_HOME/dconf/user.conf" \
