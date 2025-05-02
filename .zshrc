export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussel"
HYPHEN_INSENSITIVE="true"
zstyte ':omz:update' mode auto
zstyle ':omz:update' frequency 1
ENABLE_CORRECTION-"true"
plugins=(autoenv, battery, colored-man-pages, colorize, command-not-found, common-aliases, cp, debian, dotenv, extract, git, pip, qrcode, rclone, rsync, ssh, tmux, urltools, vscode)
source $ZSH/oh—my-zsh.sh
export EDITOR='nano'
# Aliases
alias zshconfig="nano ~/.zshrc"
alias ohmyzsh="nano ~/.oh-my-zsh"
alias pls="sudo"
