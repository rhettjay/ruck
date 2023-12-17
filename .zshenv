#!/usr/bin/env zsh

# Rucksack
export RUCKSACK="$HOME/rucksack"

# unpack rucksack if not not built
# [ -f "$RUCKSACK/unpack" ] && source "$RUCKSACK/unpack"

# XDG (Cross Desktop Group) Environment
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

# VIM Environment
export VIM_CONFIG="$XDG_CONFIG_HOME/nvim"
export EDITOR="nvim"
export VISUAL="nvim"

# zsh/zle
export HISTFILE="${ZDOTDIR:-$HOME}/.zsh_history" # History filepath
export HISTSIZE=10000 # no. events in internal history
setopt SHARE_HISTORY # share history
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS # ignore duplicate events
export SAVEHIST=5000 # no. events in history file

# node version manager
export NVM_DIR="$XDG_DATA_HOME/nvm"
