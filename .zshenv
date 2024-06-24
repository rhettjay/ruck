#!/usr/bin/env zsh

# XDG (Cross Desktop Group) Environment
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

# +------------+
# | zle options|
# +------------+
HISTSIZE=5000
HISTFILESIZE=10000
SAVEHIST=5000
setopt EXTENDED_HISTORY
HISTFILE=${XDG_CONFIG_HOME}/.zsh_history
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt prompt_subst
setopt AUTO_LIST


eval "$(/opt/homebrew/bin/brew shellenv)"

# Autosuggestions in terminal
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# autocomplete hidden files
_comp_options+=(globdots)
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#946b2d,bold,underline"

#+--------------+
#| Path options |
#+--------------+

# Python 3.11
# The original version is saved in .zprofile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/3.11/bin:${PATH}"

# Rucksack
export RUCKSACK="$HOME/rucksack"

# unpack rucksack if not not built
# [ -f "$RUCKSACK/unpack" ] && source "$RUCKSACK/unpack"


# VIM Environment
export VIM_CONFIG="$XDG_CONFIG_HOME/nvim"
export EDITOR="nvim"
export VISUAL="nvim"

# GPG Key
export GPG_TTY=\$(tty)

# Rust
# Add .bin .cargo/bin /bin and wabt/build to bin
export PATH="$PATH:$HOME/.bin:$HOME/.cargo/bin:$HOME/bin:$HOME/sandbox/web-assembly-crt/wabt/build:$HOME/.cargo/env"

#WASM HOME
export WASMTIME_HOME="$XDG_CONFIG_HOME/.wasmtime"
export PATH="$WASMTIME_HOME/bin:$PATH"

#VOLTA Setup
export VOLTA_HOME="$XDG_CONFIG_HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"


#RANCHER Desktop
export PATH="/Users/rbulkley/.rd/bin:$PATH"

#NVIM Setup (migrated to nvim)
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# most important functions

#+------------------+
#| JQ Color options |
#+------------------+
#
# Color Pattern: "null:false:true:numbers:strings:arrays:objects:object keys" [0;31:...]
export JQ_COLORS="0;90:0;39:0;39:0;39:0;32:1;39:1;39:1;36"
