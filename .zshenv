# default apps
export EDITOR="nvim"
export TERMINAL="alacritty"

# path
export PATH=~/.local/bin/:~/.local/bin/npm-global/bin:$PATH

# XDG directories
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# disable less hist
export LESSHISTFILE=-

# exports
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export ZDOTDIR="$HOME"/.config/zsh
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export VIMINIT='let $MYVIMRC = !has("nvim") ? "$XDG_CONFIG_HOME/vim/vimrc" : "$XDG_CONFIG_HOME/nvim/init.lua" | so $MYVIMRC'
