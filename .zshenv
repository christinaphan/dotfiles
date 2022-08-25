typeset -U PATH path
path=("$HOME/bin" "$HOME/.local/bin" "$path[@]")
export PATH

# XDG directories
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# disable less hist
export LESSHISTFILE=-

# zsh hist
export HISTFILE="$XDG_DATA_HOME"/zsh/history
. "$HOME/.cargo/env"
