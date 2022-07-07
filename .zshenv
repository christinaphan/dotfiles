typeset -U PATH path
path=("$HOME/bin" "$HOME/.local/bin" "$path[@]")
export PATH

# XDG directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# wget
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"

# npm
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc 

# anaconda
export CONDARC="$XDG_CONFIG_HOME/conda/condarc"

# gnupg
export GNUPGHOME="$XDG_DATA_HOME"/gnupg

# disable less hist
export LESSHISTFILE=-

# zsh hist
export HISTFILE="$XDG_DATA_HOME"/zsh/history

# editor
export EDITOR=nvim
export VISUAL=nvim
. "$HOME/.cargo/env"
