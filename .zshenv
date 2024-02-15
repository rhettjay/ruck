#!/usr/bin/env zsh
# +------------+
# | zle options|
# +------------+
HISTSIZE=5000
HISTFILESIZE=10000
SAVEHIST=5000
setopt EXTENDED_HISTORY
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt prompt_subst
setopt AUTO_LIST


eval "$(/opt/homebrew/bin/brew shellenv)"

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

# XDG (Cross Desktop Group) Environment
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

# VIM Environment
export VIM_CONFIG="$XDG_CONFIG_HOME/nvim"
export EDITOR="nvim"
export VISUAL="nvim"

# GPG Key
export GPG_TTY=\$(tty)

# Add .bin .cargo/bin /bin and wabt/build to bin
PATH="$PATH:$HOME/.bin:$HOME/.cargo/bin:$HOME/bin:$HOME/sandbox/web-assembly-crt/wabt/build"

#WASM HOME
export WASMTIME_HOME="$HOME/.wasmtime"
export PATH="$WASMTIME_HOME/bin:$PATH"

#VOLTA Setup
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

#NVIM Setup (migrated to nvim)
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# most important functions
