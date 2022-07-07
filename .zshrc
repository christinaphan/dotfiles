# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/christina/.zshrc'

autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
# End of lines added by compinstall

autoload -Uz promptinit
promptinit

prompt walters

# colorful ls
autoload -U colors
colors

export CLICOLOR=1
alias ls='lsd'

alias g++='g++ --std=c++14 -Wall -Werror' 
alias cpplint='cpplint --filter=-legal/copyright'

alias ssh_davis='ssh cphan69@pc22.cs.ucdavis.edu'

alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

colorscript -r

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/christina/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/christina/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/christina/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/christina/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# zsh syntax highlighting and autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# powerlevel10k
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
