# +--------+
# | Colors |
# +--------+
default="\033[39m"
black="\033[30m"
red="\033[0;31m"
green="\033[32m"
yellow="\033[33m"
blue="\033[34m"
magenta="\033[35m"
cyan="\033[36m"
light_gray="\033[37m"
dark_gray="\033[90m"
light_red="\033[91m"
light_green="\033[92m"
light_yellow="\033[93m"
light_blue="\033[94m"
light_magenta="\033[95m"
light_cyan="\033[96m"
white="\033[97m"

# +-------+
# | Emoji |
# +-------+

# Randomly retrieve an emoji from a defined list
# https://unix.stackexchange.com/questions/287330/accessing-random-array-element-in-zsh
function random_el {
  # take in array as 
 declare -a array=("$@")
 r=$(($RANDOM % ${#array[@]}))
 printf "%s\n" "${array[$r]}"
}

FAV_EMOJIS=(🐙 🚀 🦑 🐑)

setTermEmoji () {
  EMOJI=${FAV_EMOJIS[$RANDOM % ${#FAV_EMOJIS[@]}]};
  #EMOJI="$(random_el 🐙 🚀 🦑 🐑)"
  printf "%s\n" "$EMOJI"
}

# +----------------------------------------------------+
# | Useful for mentally differentiating iterm contexts |
# +----------------------------------------------------+

#newRandomEmoji () {
#  setTermEmoji "$(random_element 👽 🔥 🚀 👻 ⛄ 👾 🐑 🏎 🤖 🦄 🌮 🐳 🐿 🐵 🐻 🦊 🐙 🦎 🦖 🦕 🦍 🦈 🐊 🦂 🐢 🐘 🐉 ⚡️ 🔱 🦑)"
#}

setTermEmoji
 
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
PATH="$PATH:$HOME/.bin:$HOME/.cargo/bin:$HOME/bin:$HOME/sandbox/web-assembly-crt/wabt/build"

autoload -U colors && colors
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git svn
precmd() {
    vcs_info
}

setopt prompt_subst

PROMPT='%u%~${vcs_info_msg_0_} $EMOJI '
## Add git info to zle
zstyle ':vcs_info:git*' formats "%{$fg[cyan]%}[%b]%{$reset_color%}%m%u%c%{$reset_color%}"
## Ignore .lock files when using tab
zstyle ':completion:*:*:vim:*:files' ignored-patterns '*.lock'
## Add groups with autotab
zstyle ':completion:*' group-name ''
## pretty ls colors from tab
zstyle ':completion:*' list-colors ${(s.:.)ZLS_COLORS}
## ls -l from tab
zstyle ':completion:*' files-list all
## fuzzy find next best with tab
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
## cp file sort reverse
zstyle ':completion:*:*:cp:*' file-sort modification reverse
## menu
zstyle ':completion:*' menu select

## bindkeys for menu navigation
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char

## zstyle ':completion:*:*:*:*:*' verbose yes

# allow vim like editing in zle
# autoload -Uz edit-command-line
# zle -N edit-command-line
# bindkey -M vicmd v edit-command-line

## git aliases
function gc { git commit -m "$@"; }
alias gs="git status";
alias gp="git pull";
alias gf="git fetch";
alias gpush="git push";
alias gd="git diff";
alias ga="git add .";
alias sw="git switch"
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
alias sl="ls"
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
alias cpz="rm -i ~/rucksack/.zshrc cp ~/.zshrc rucksack/"
alias sack="rm -irf ~/rucksack cp ~/.zshrc rucksack/"
alias ruck="rm -irf ~/.config/ cp ~/rucksack/.config ~/.config"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export WASMTIME_HOME="$HOME/.wasmtime"

export PATH="$WASMTIME_HOME/bin:$PATH"

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

