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

# CUnit (and other external C libraries installed via brew)
export CPATH=/opt/homebrew/include
export LIBRARY_PATH=/opt/homebrew/lib

# xdg-ninja exports
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export ZDOTDIR="$HOME"/.config/zsh
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export VIMINIT='let $MYVIMRC = !has("nvim") ? "$XDG_CONFIG_HOME/vim/vimrc" : "$XDG_CONFIG_HOME/nvim/init.lua" | so $MYVIMRC'
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export PYTHONSTARTUP="/etc/python/pythonrc"
export IPYTHONDIR="${XDG_CONFIG_HOME}/ipython"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export TERMINFO="$XDG_DATA_HOME"/terminfo
export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo:/usr/share/terminfo
export ZDOTDIR="$HOME"/.config/zsh
export CABAL_CONFIG="$XDG_CONFIG_HOME"/cabal/config
export CABAL_DIR="$XDG_DATA_HOME"/cabal
export STACK_ROOT="$XDG_DATA_HOME"/stack
export GHCUP_USE_XDG_DIRS=true
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export GEM_HOME="${XDG_DATA_HOME}"/gem
export GEM_SPEC_CACHE="${XDG_CACHE_HOME}"/gem
. "/Users/christina/.local/share/cargo/env"
