alias \
	h="cd $HOME/ && ls -a" \
	c="calcurse" \
	d="cd $HOME/doc && lf" \
	n="$EDITOR $MGH/notes/index.md" \
	D="cd $HOME/dl && lf" \
	mu="cd $HOME/doc/media/mu && lf" \
	img="cd $HOME/doc/media/img && lf" \
	vid="cd $HOME/doc/media/vid && lf" \
	gh="cd $GH && lf" \
	mgh="cd $MGH && lf" \
	gp="cd $GOPATH && lf" \
	lc="cd $HOME/.local && lf" \
	sc="cd $HOME/.local/bin && ls -a" \
	mn="cd /mnt && ls -a" \
	bf="$EDITOR $XDG_CONFIG_HOME/files" \
	bd="$EDITOR $XDG_CONFIG_HOME/directories" \
	bw="$EDITOR $XDG_CONFIG_HOME/bookmarks" \
	cfa="$EDITOR $XDG_CONFIG_HOME/shell/aliasrc" \
	cfs="$EDITOR $XDG_CONFIG_HOME/shell/shortcutrc" \
	cfkb="cd /home/dwm/qmk_firmware/keyboards/preonic/keymaps/duckzcantfly && $EDITOR keymap.c" \
	cfz="$EDITOR $ZDOTDIR/.zshrc" \
	cfzp="lf $ZPLUGINDIR/zsh-config-as-plugin" \
	cfc="$EDITOR $XDG_DATA_HOME/calcurse/apts" \
	cfv="$EDITOR $XDG_CONFIG_HOME/nvim/init.vim" \
	cfm="$EDITOR $XDG_CONFIG_HOME/mutt/muttrc" \
	cfd="$EDITOR $HOME/.Xdefaults" \
	cfu="$EDITOR $XDG_CONFIG_HOME/newsboat/urls" \
	cfn="$EDITOR $XDG_CONFIG_HOME/newsboat/config" \
	cfmb="$EDITOR $XDG_CONFIG_HOME/ncmpcpp/bindings" \
	cfmc="$EDITOR $XDG_CONFIG_HOME/ncmpcpp/config" \
	cfdc="dconf dump / >$XDG_CONFIG_HOME/dconf/user.conf \
		&& $EDITOR -c 'setf dosini' $XDG_CONFIG_HOME/dconf/user.conf \
		&& dconf load / <$XDG_CONFIG_HOME/dconf/user.conf" \
	s="cd $HOME/doc/school && lf" \
	ltn="cd $HOME/doc/media/books/ln && lf" \
	b="cd $HOME/doc/books && lf" \
	gop="cd $XDG_DATA_HOME/go" \
