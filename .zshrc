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

autoload -U colors && colors
autoload -Uz vcs_info
setopt prompt_subst

# zstyle ':vcs_info:*' enable git
# zstyle ':vcs_info:git:*' check-for-changes true
## Add git info to zle

# %r = repo name
# %R = abosolute repo path
# %s = vcs in use (git, svn, mercury)
# %S = subdir within repo
# %{%} = escaped sequence
# %b = branch
# %m = misc replacement (git rebase/cherry-pick) controlled by patch-format/no-patch-format
# %u = The string from the unstagedstr style if there are unstaged changes in the repository.
# %c = number of unapplied patches
# zstyle ':vcs_info:git:*' action-formats "%r%{$fg[cyan]%}[%b]%{$reset_color%}%m%u%c%{$reset_color%}"
zstyle ':vcs_info:git:*' formats "%r%{$fg[cyan]%}[%b]%{$reset_color%}%m%u%c%{$reset_color%}"
# zstyle ':vcs_info:git:*' patch-formats "%r%{$fg[cyan]%}[%b]%{$reset_color%}%m%u%c%{$reset_color%}"

# +--------+
# | prompt |
# +--------+
#
# setPrompt () {
#   EMOJI="$*"
#   DISPLAY_DIR='$(vcs_info)'
#   DISPLAY_BRANCH='$(git_branch)'
#   PROMPT='%~%{vcs_info_msg_0} ${vcs_info_msg_0_} ${EMOJI} '
#   # Old Prompt included full directory listing
#   #PROMPT='%u%~${vcs_info_msg_0_} ${EMOJI} '
# }

# https://unix.stackexchange.com/questions/287330/accessing-random-array-element-in-zsh
# Randel picks a random element from the given list
function randEL {
 declare -a array=("$@")
 r=$(($RANDOM % ${#array[@]}))
 printf "%s\n" "${array[$r]}"
 #return "${array[$r]}"
}


function getPromptOpts {
  TERM_ID="$(randEL 🚀 👻 👾 🦄 🐳 🐻 🦊 🐙 🦖 🦕 🐢 🐉 ⚡️ 🔱 🦑)"
  DISPLAY_DIR="$(dirs)"
  LOCAL_SECRETS=" "
  PROMPT="%u%3~$vcs_info_msg_0_ ${TERM_ID%2%G} "
}

# function cd () {
#   builtin cd "$@" && [[ -f .zsh_config ]] && . .aliases
#   return 0
# }

DEV_CLIENT="NOT SET"

getPromptOpts

precmd() {
    vcs_info
     if [[ -z $vcs_info_msg_0_ ]]; then
       PROMPT="%3~ ${TERM_ID%2G%} "
     elif [[ ! -z $vcs_info_msg_0_ ]]; then
      if [[ $DEV_CLIENT != "NOT SET" ]]; then
        PROMPT="%F{white}^%f%2d.$vcs_info_msg_0_ [%F{yellow}E%f] %{$TERM_ID%2G%} "
      else
        PROMPT="%F{white}^%f%2d.$vcs_info_msg_0_ [%F{blue}e%f] %{$TERM_ID%2G%} "
      fi
     fi
}

function chpwd {
do-local
}

function do-local {
if [[ $(git $PWD rev-parse --is-inside-work-tree 2>/dev/null; echo $?) -ge 1 ]]; then
      export PRD_CLIENT="NOT SET"
      export PRD_SECRET="NOT SET"
      export DEV_CLIENT="NOT SET"
      export DEV_SECRET="NOT SET"
    else
      DIR="$(git rev-parse --show-toplevel --sq --quiet $PWD)"
      if [[ $DIR != "" ]]; then
        source "$DIR/.zsh_config"
      else
        return 1
      fi
    fi
}


#+----------------+
#| Zstyle options |
#+----------------+

## Ignore .lock files wgedstr style if there are staged changes in the repository.hen using tab
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
##
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'style ':completion:*' menu select

#eval "$(op completion zsh)"; compdef _op op


#+------------------+
#| zle vim keybinds |
#+------------------+

## bindkeys for menu navigation
# zmodload zsh/complist
# bindkey -M menuselect 'h' vi-backward-char
# bindkey -M menuselect 'k' vi-up-line-or-history
# bindkey -M menuselect 'j' vi-down-line-or-history
# bindkey -M menuselect 'l' vi-forward-char

## zstyle ':completion:*:*:*:*:*' verbose yes

# allow vim like editing in zle
# autoload -Uz edit-command-line
# zle -N edit-command-line
# bindkey -M vicmd v edit-command-line


#+-----------------------------------------+
#| Prompt suggestions & Sourcing zsh files |
#+-----------------------------------------+


# Add all the zsh aliases
source ~/rucksack/.zshenv
source ~/rucksack/.zsh_aliases

