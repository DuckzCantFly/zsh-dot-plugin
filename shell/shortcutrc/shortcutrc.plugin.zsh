alias \
	h="cd $HOME/ && ls -a" \
	c="calcurse" \
	d="cd $HOME/doc && cf" \
	n="$EDITOR $MGH/notes/index.md" \
	D="cd $HOME/dl && cf" \
	mu="cd $HOME/doc/media/mu && cf" \
	img="cd $HOME/doc/media/img && cf" \
	vid="cd $HOME/doc/media/vid && cf" \
	gh="cd $GH && cf" \
	mgh="cd $MGH && cf" \
	gp="cd $GOPATH && cf" \
	lc="cd $HOME/.local && cf" \
	sc="cd $HOME/.local/bin && ls -a" \
	mn="cd /mnt && ls -a" \
	bf="$EDITOR $XDG_CONFIG_HOME/files" \
	bd="$EDITOR $XDG_CONFIG_HOME/directories" \
	bw="$EDITOR $XDG_CONFIG_HOME/bookmarks" \
	cfa="$EDITOR $XDG_CONFIG_HOME/zsh/plugins/zsh-config-as-plugin/shell/aliasrc/aliasrc.plugin.zsh" \
	cfs="$EDITOR $XDG_CONFIG_HOME/zsh/plugins/zsh-config-as-plugin/shell/shortcutrc/shortcutrc.plugin.zsh" \
	cfkb="cd /home/dwm/qmk_firmware/keyboards/preonic/keymaps/duckzcantfly && $EDITOR keymap.c" \
	cfz="$EDITOR $ZDOTDIR/.zshrc" \
	cfzp="cf $ZPLUGINDIR/zsh-config-as-plugin" \
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
	s="cd $HOME/doc/school && cf" \
	ltn="cd $HOME/doc/media/books/ln && cf" \
	b="cd $HOME/doc/books && cf" \
	gop="cd $XDG_DATA_HOME/go" \
