# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


HISTSIZE=1000
SAVEHIST=1000

# colorful ls
export CLICOLOR=1
alias ls='lsd'

# aliases
alias g++='g++ --std=c++14 -Wall -Werror' 
alias cpplint='cpplint --filter=-legal/copyright'
alias ssh_davis='ssh cphan69@pc31.cs.ucdavis.edu'
alias ssh_rostam='ssh cphan69@rostam.idav.ucdavis.edu'
alias ssh_sohrab='ssh cphan69@sohrab.idav.ucdavis.edu'
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"

# zsh syntax highlighting and autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# powerlevel10k
source ~/.config/powerlevel10k/powerlevel10k.zsh-theme   

# CUnit (and other external C libraries installed via brew)
export CPATH=/opt/homebrew/include
export LIBRARY_PATH=/opt/homebrew/lib

# xdg-ninja
export XDG_RUNTIME_DIR=/run/user/501
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export IPYTHONDIR="${XDG_CONFIG_HOME}/ipython"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export TERMINFO="$XDG_DATA_HOME"/terminfo
export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo:/usr/share/terminfo
export ZDOTDIR="$HOME"/.config/zsh
export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/pythonrc"


# To customize prompt, run `p10k configure`
[[ ! -f ${ZDOTDIR:-~}/.p10k.zsh ]] || source ${ZDOTDIR:-~}/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
