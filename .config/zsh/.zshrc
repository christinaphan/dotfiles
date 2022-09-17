# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


HISTSIZE=1000
SAVEHIST=1000

# autocompletion
zstyle :compinstall filename '/home/christina/.zshrc'
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
# zcompdump
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"

# colorful ls
export CLICOLOR=1
alias ls='lsd'

# aliases
alias g++='g++ --std=c++14 -Wall -Werror' 
alias cpplint='cpplint --filter=-legal/copyright'
alias ssh_davis='ssh cphan69@pc22.cs.ucdavis.edu'
alias ssh_rostam='ssh cphan69@rostam.idav.ucdavis.edu'
alias ssh_sohrab='ssh cphan69@sohrab.idav.ucdavis.edu'
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias zathura='zathura --fork'
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"

colorscript -r

# zsh syntax highlighting and autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# powerlevel10k
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure`
[[ ! -f ${ZDOTDIR:-~}/.p10k.zsh ]] || source ${ZDOTDIR:-~}/.p10k.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/christina/.config/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/christina/.config/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/christina/.config/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/christina/.config/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

