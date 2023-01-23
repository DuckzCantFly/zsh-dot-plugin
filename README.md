# zsh-dot-plugin
> Ever want a .zshrc with only ~21 lines of code?

My personal .zshrc but in the form of a plugin.
`.zshrc` not included.

The [Plugin Management](https://github.com/DuckzCantFly/zsh-dot-plugin/blob/main/plugin-loader/plugin-loader.plugin.zsh) based is on [zsh_unplugged](https://github.com/mattmc3/zsh_unplugged). 
Check out that repo for a full rundown on how the plugin management works.

## Set up

### Bootstrap
Add these lines to the start of your .zshrc replacing repo lines with your own fork.

```zsh
# Boot-straped ZSH Config

# Where should we download your Zsh plugins?
ZPLUGINDIR=${ZDOTDIR:-${XDG_CONFIG_HOME:-${HOME}/.config}/zsh}/plugins

# Boot Strap
if [ ! -d ${ZPLUGINDIR}/zsh-dot-plugin ]; then
	mkdir -p "${ZPLUGINDIR}" 2> /dev/null
	git clone --quiet "git@github.com:DuckzCantFly/zsh-dot-plugin" "${ZPLUGINDIR}/zsh-dot-plugin"
fi

# Load Plugin Loader
source $ZPLUGINDIR/zsh-dot-plugin/plugin-loader/plugin-loader.plugin.zsh
```

### Minimal Load
Then add these lines to load all configuration sutomagicaly.

```zsh
# Load Config
plugins=(
	zsh-dot-plugin/load-all
) ; plugin-source ${plugins}
```

There you have it a zsh config in 18 lines!

But Thought this would be 21? That's including the [ZSHPLUGSPEED](#Config-Options) option mentioned in the config section.

### Choosie Load
You also more explicitly load plugins like this:

```zsh
# Plugin Load for Github.com
repos=(
	## Where should plugins be downloaded fron?
	https://github.com/
	## Plugins
	romkatv/zsh-defer
	zsh-users/zsh-completions
	zsh-users/zsh-history-substring-search
	zsh-users/zsh-autosuggestions
	zdharma-continuum/fast-syntax-highlighting
	hlissner/zsh-autopair
	djui/alias-tips
	kutsan/zsh-system-clipboard
) ; plugin-clone ${repos}

# Source Plugins
plugins=(
	## User Config
	zsh-dot-plugin/general
	zsh-dot-plugin/general/history
	zsh-dot-plugin/general/tab-complete
	zsh-dot-plugin/fch
	## Plugin Config
	zsh-dot-plugin/plugins/plugin-config
	## Plugins
	zsh-defer # Only put plugins after this one if not needed imedatly at start.
	zsh-completions
	zsh-history-substring-search
	zsh-autosuggestions
	fast-syntax-highlighting
	zsh-autopair
) ; plugin-source ${plugins}
```
A little longer but if you want to manage your plugins outdide of [plugins/plugins.plugin.zsh](https://github.com/DuckzCantFly/zsh-dot-plugin/blob/main/plugins/plugins.plugin.zsh) its a good option.

## Configuration
Git fork it, clone it, edit all the files to your preference and have a short organized config.

### Config Options
On a serious note there is an option for the plugin loader. 
You can set `zplugspeed="true"` to speed up your plugin loading.

Example:

```zsh
#...
source $ZPLUGINDIR/zsh-dot-plugin/plugin-loader/plugin-loader.plugin.zsh

# Autocompile Plugins
ZPLUGSPEED="true"

# Load Config
plugins=(
#...
```
Sad but with this option you'll have a whopping 21 lines in your config. 

Sad times we are living in.

## Commands
Update all plugins with the `plugin-update` function.

Recompile all plugins to byte code with the `plugin-compile` function.
This is usefull if you make changes to your config. I recommend doing this on first launch.

By sourcing the [shell](https://github.com/DuckzCantFly/zsh-dot-plugin/blob/main/shell/shell.plugin.zsh) plugin you can run the `cfz` alias open this repo in your `$EDITOR`.

## Full Example .zshrc

```zsh
# Boot-Straped ZSH Config

# Where should we download your Zsh plugins?
ZPLUGINDIR=${ZDOTDIR:-${XDG_CONFIG_HOME:-${HOME}/.config}/zsh}/plugins

# Boot Strap
if [ ! -d ${ZPLUGINDIR}/zsh-config-as-plugin ]; then
	mkdir -p "${ZPLUGINDIR}" 2> /dev/null
	git clone --quiet "git@github.com:DuckzCantFly/zsh-dot-plugin" "${ZPLUGINDIR}/zsh-dot-plugin"
fi

# Load Plugin Loader
source $ZPLUGINDIR/zsh-dot-plugin/plugin-loader/plugin-loader.plugin.zsh

# Autocompile Plugins
ZPLUGSPEED="true"

# Load Config
plugins=(
	zsh-dot-plugin/load-all
) ; plugin-source ${plugins}
```
