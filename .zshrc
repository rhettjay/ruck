R='\033[0;31m'   #'0;31' is Red's ANSI color code
G='\033[1;32m'   #'1;32' is Yellow's ANSI color code
B='\033[0;34m'   #'0;34' is Blue's ANSI color code

#echo "${R}
#      ,  ${G}{BULKLEY}${R}  ,    
#     //             \\\\\  
#    ((__,-\"\"\"\"\"\"\"-,__)) 
#    '----)~     ~(----\` 
#     .-'(  .    . )\`-,  
#     \`~~\`\       /\`~~\`  
#          |     |      
#          \o___o)      
#           \___/       
#
#                       "

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

function random_element {
  declare -a array=("$@")
  r=$((RANDOM % ${#array[@]}))
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
  setEmoji "$(random_element 😅 👽 🔥 🚀 👻 ⛄ 👾 🍔 😄 🍰 🐑 😎 🏎 🤖 😇 😼 💪 🦄 🥓 🌮 🎉 💯 ⚛️ 🐠 🐳 🐿 🥳 🤩 🤯 🤠 👨‍💻 🦸‍ 🧝‍ 🧞‍ 🧙‍ 👨‍🚀 👨‍🔬 🕺 🦁 🐶 🐵 🐻 🦊 🐙 🦎 🦖 🦕 🦍 🦈 🐊 🦂 🐍 🐢 🐘 🐉 🦚 ✨ ☄️ ⚡️ 💥 💫 🧬 🔮 ⚗️ 🎊 🔭 ⚪️ 🔱)"
}

newRandomEmoji

# Custom bin
PATH="$PATH:$HOME/.bin"

autoload -U colors && colors
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git svn
precmd() {
    vcs_info
}

setopt prompt_subst


#RPROMPT="(%D{%d/%m|%H:%M:})"
zstyle ':vcs_info:git*' formats "%{$fg[cyan]%}[%b]%{$reset_color%}%m%u%c%{$reset_color%}"


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

#alias git=hub

