# XDG (Cross Desktop Group) Environment
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

# +-------------------------------------------------------------------------+
# | zle options https://zsh.sourceforge.io/Doc/Release/Options.html#Options |
# +-------------------------------------------------------------------------+
bindkey '^j' history-search-backward
bindkey '^k' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
HISTFILESIZE=10000
SAVEHIST=$HISTSIZE
HISTDUPE=erase
setopt extended_history
setopt inc_append_history
setopt append_history
setopt hist_ignore_all_dups   # ignore duplicated commands history list
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt auto_list

# Check arch then set homebrew prefix accordingly
case "$(uname -m)" in
    x*)
        HOMEBREW_PREFIX=/usr/local
        ;;
    arm*)
        HOMEBREW_PREFIX=/opt/homebrew
        ;;
esac
eval "$($HOMEBREW_PREFIX/bin/brew shellenv)"
# Autosuggestions in terminal
source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# autocomplete hidden files
_comp_options+=(globdots)
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#69cfd2,bold,underline"
# Fast stntax highlightjng
source ~/buckleup/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

#+--------------+
#| Path options |
#+--------------+

# Python 3.11
# The original version is saved in .zprofile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/3.11/bin:${PATH}"

# unpack rucksack if not not built
# [ -z stow "$RUCK" ]


# VIM Environment
export VIMRUNTIME="$HOMEBREW_PREFIX/share/nvim/runtime"
export VIM_CONFIG="$XDG_CONFIG_HOME/nvim"
export EDITOR="nvim"
export VISUAL="nvim"

# Man pager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# GPG Key
export GPG_TTY=\$(tty)

# Wezterm
export WEZTERM_CONFIG_FILE='~/.config/wezterm/wezterm.lua'

# Rust
# Add .bin .cargo/bin /bin and wabt/build to bin
export PATH="$PATH:$HOME/.bin:$HOME/.cargo/bin:$HOME/bin:$HOME/sandbox/web-assembly-crt/wabt/build:$HOME/.cargo/env"

# WASM HOME
export WASMTIME_HOME="$XDG_CONFIG_HOME/.wasmtime"
export PATH="$WASMTIME_HOME/bin:$PATH"

# VOLTA Setup
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"


# RANCHER Desktop
export PATH="/Users/rbulkley/.rd/bin:$PATH"

# NVM Setup (migrated to volta)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion most important functions

#+------------------+
#| JQ Color options |
#+------------------+
#
# Color Pattern: "null:false:true:numbers:strings:arrays:objects:object keys" [0;31:...]
export JQ_COLORS="0;90:0;39:0;39:0;39:0;32:1;39:1;39:1;36"
