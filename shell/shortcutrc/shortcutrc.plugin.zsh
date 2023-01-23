### shortcutrc ###

alias \
	h="cd $HOME/ && ls -a" \
	c="calcurse" \
	d="cf $HOME/doc" \
	n="$EDITOR $MGH/notes/index.md" \
	D="cf $HOME/dl" \
	mu="cf $HOME/doc/media/mu" \
	img="cf $HOME/doc/media/img" \
	vid="cf $HOME/doc/media/vid" \
	gh="cf $GH" \
	mgh="cf $MGH" \
	gp="cf $GOPATH" \
	lc="cf $HOME/.local" \
	sc="cf $HOME/.local/bin-a" \
	mn="cd /mnt && ls -a" \
	bf="$EDITOR $XDG_CONFIG_HOME/files" \
	bd="$EDITOR $XDG_CONFIG_HOME/directories" \
	bw="$EDITOR $XDG_CONFIG_HOME/bookmarks" \
	cfa="$EDITOR $XDG_CONFIG_HOME/zsh/plugins/zsh-config-as-plugin/shell/aliasrc/aliasrc.plugin.zsh" \
	cfs="$EDITOR $XDG_CONFIG_HOME/zsh/plugins/zsh-config-as-plugin/shell/shortcutrc/shortcutrc.plugin.zsh" \
	cfkb="cd /home/dwm/qmk_firmware/keyboards/preonic/keymaps/duckzcantfly && $EDITOR keymap.c" \
	cfzp="$EDITOR $ZPLUGINDIR/zsh-dot-plugin" \
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
	s="cf $HOME/doc/school" \
	ltn="cf $HOME/doc/media/books/ln" \
	b="cf $HOME/doc/books" \
	gop="cd $XDG_DATA_HOME/go" \
