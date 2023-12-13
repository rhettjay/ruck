R='\033[0;31m'   #'0;31' is Red's ANSI color code
G='\033[1;32m'   #'1;32' is Yellow's ANSI color code
B='\033[0;34m'   #'0;34' is Blue's ANSI color code

OCTO=🐙
SQUID=🦑
ROCKET=🚀
  
HISTSIZE=5000
HISTFILESIZE=10000
SAVEHIST=5000
setopt EXTENDED_HISTORY
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS

# Custom bin
PATH="$PATH:$HOME/.bin:$HOME/.cargo/bin:$HOME/bin"

autoload -U colors && colors
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git svn
precmd() {
    vcs_info
}

setopt prompt_subst

PROMPT='%u%~${vcs_info_msg_0_} $SQUID '
zstyle ':vcs_info:git*' formats "%{$fg[cyan]%}[%b]%{$reset_color%}%m%u%c%{$reset_color%}"
zstyle ':completion:*:*:-command-:*:*' ignored-patterns '*.lock'


## git aliases
function gc { git commit -m "$@"; }
alias gs="git status";
alias gp="git pull";
alias gf="git fetch";
alias gpush="git push";
alias gd="git diff";
alias ga="git add .";
dif() { git diff --color --no-index "$1" "$2" | diff-so-fancy; }
cdiff() { code --diff "$1" "$2"; }

function clone { if [[ $PWD == ~/work ]];
  then
    gh repo clone "$WORK"/$1;
  else
    gh repo clone $1;
  fi;
}

# terraform quick access
alias initt="terraform init";
alias inittu="terraform init -upgrade";
alias plan-t="terraform plan";
alias tapply="terraform plan -apply";

## eza (exa replacement -- ls replacement) aliases
alias ld="eza -lD"
alias lf="eza -lF --color=always | grep -v /"
alias lh="eza -dl .* --group-directories-first"
alias ls="eza --group-directories-first"
alias ll="eza -alF --color=always --sort=size | grep -v /"
alias lt="eza -al --sort=modified"

export GPG_TTY=\$(tty)
alias vim="nvim"
alias vi="nvim"
alias dev="cd ~/dev"
alias ..="cd .."
alias ..l="cd ../ && ls"
alias vz="vi ~/.zshrc"
alias sz=". ~/.zshrc"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Autosuggestions in terminal
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

#Nix
##alias nix-shell="nix-shell --run zsh"
#if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
# . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
#fi
# End Nix
#
#
#
####---- NEW TERM CONFIGURATION --- ####
# function random_element {
#  declare -a array=("$@")
#  r=$(($RANDOM % ${#array[@]}))
#  printf "%s\n" "${array[$r]}"
#}
#
## Default Prompt
#setEmoji () {
#  EMOJI="$*"
#  DISPLAY_DIR='$(dirs)'
#  DISPLAY_BRANCH='$(git_branch)'
#  PROMPT='%u%~${vcs_info_msg_0_} ${EMOJI} '
#}
#
#newRandomEmoji () {
#  setEmoji "$(random_element 👽 🔥 🚀 👻 ⛄ 👾 🐑 🏎 🤖 🦄 🌮 🐳 🐿 🐵 🐻 🦊 🐙 🦎 🦖 🦕 🦍 🦈 🐊 🦂 🐢 🐘 🐉 ⚡️ 🔱 🦑)"
#}
#
#newRandomEmoji
#  
#HISTSIZE=5000
#HISTFILESIZE=10000
#SAVEHIST=5000
#setopt EXTENDED_HISTORY
#HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
#setopt SHARE_HISTORY
#setopt APPEND_HISTORY
#setopt INC_APPEND_HISTORY
#setopt HIST_IGNORE_DUPS
#
## Custom bin
#PATH="$PATH:$HOME/.bin"
#
#autoload -U colors && colors
#autoload -Uz vcs_info
#
#zstyle ':vcs_info:*' enable git svn
#precmd() {
#    vcs_info
#}
#
#setopt prompt_subst
#
#zstyle ':vcs_info:git*' formats "%{$fg[cyan]%}[%b]%{$reset_color%}%m%u%c%{$reset_color%}"
