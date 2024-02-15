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

# +------------------------------------------------------------------+
# | Emoji prompt: Useful for mentally differentiating iterm contexts |
# +------------------------------------------------------------------+
setEmoji () {
  EMOJI="$*"
  DISPLAY_DIR='$(dirs)'
  DISPLAY_BRANCH='$(git_branch)'
  PROMPT='%u%~${vcs_info_msg_0_} ${EMOJI} '
}

newRandomEmoji () {
  setEmoji "$(random_element 👽 🔥 🚀 👻 👾 🐑 🤖 🦄 🌮 🐳 🐵 🐻 🦊 🐙 🦎 🦖 🦕 🦍 🦈 🐊 🦂 🐢 🐘 🐉 ⚡️ 🔱 🦑)"
}

newRandomEmoji

autoload -U colors && colors
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git svn
precmd() {
    vcs_info
}

PROMPT='%u%~${vcs_info_msg_0_} $EMOJI '

#+----------------+
#| Zstyle options |
#+----------------+

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
##
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'style ':completion:*' menu select


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
#
export XDG_CONFIG_HOME="${HOME}/.config"
export RUCKSACK_HOME="${HOME}/rucksack"
source ${RUCKSACK_HOME}/.zshenv
source ${RUCKSACK_HOME}/.zsh-aliases

# Autosuggestions in terminal
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# autocomplete hidden files
_comp_options+=(globdots)

