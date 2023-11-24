alias ..="cd ../"
alias ..l="cd ../ && ll"
alias vz="vi ~/.zshrc"
alias sz=". ~/.zshrc"

function random_element {
  declare -a array=("$@")
  r=$(($RANDOM % ${#array[@]}))
  printf "%s\n" "${array[$r]}"
}

# Default Prompt
setEmoji () {
  EMOJI="$*"
  DISPLAY_DIR='$(dirs)'
  DISPLAY_BRANCH='$(git_branch)'
  PROMPT='%u%~${vcs_info_msg_0_} ${EMOJI} '
}

newRandomEmoji () {
  setEmoji "$(random_element 👽 🔥 🚀 👻 ⛄ 👾 🐑 🏎 🤖 🦄 🌮 🐳 🐿 🐵 🐻 🦊 🐙 🦎 🦖 🦕 🦍 🦈 🐊 🦂 🐢 🐘 🐉 ⚡️ 🔱 🦑)"
}

newRandomEmoji
  
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
PATH="$PATH:$HOME/.bin"

autoload -U colors && colors
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git svn
precmd() {
    vcs_info
}

setopt prompt_subst

zstyle ':vcs_info:git*' formats "%{$fg[cyan]%}[%b]%{$reset_color%}%m%u%c%{$reset_color%}"

## git aliases
function gc { git commit -m "$@"; }
alias gs="git status";
alias gp="git pull";
alias gf="git fetch";
alias gpush="git push";
alias gd="git diff";
alias ga="git add .";
alias glone="gh repo clone";
alias initn="npm init";
alias initt="terraform init";
alias inittu="terraform init -upgrade";
alias plan-t="terraform plan";
alias tapply="terraform plan -apply";
dif() { git diff --color --no-index "$1" "$2" | diff-so-fancy; }
cdiff() { code --diff "$1" "$2"; }

function clone { if [[ $PWD == ~/work ]];
  then
    gh repo clone "$WORK"/$1;
  else
    gh repo clone $1;
  fi;
}

source $( brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
