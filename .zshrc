export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 1

ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

plugins=(git kitty python rclone)

source $ZSH/oh-my-zsh.sh

export EDITOR='nano'

source $HOME/.config/benji/aliases.zsh
