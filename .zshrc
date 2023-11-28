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
PATH="$PATH:$HOME/.bin:$HOME/.cargo/bin"

autoload -U colors && colors
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git svn
precmd() {
    vcs_info
}

setopt prompt_subst

PROMPT='%u%~${vcs_info_msg_0_} $SQUID '
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

export GPG_TTY=\$(tty)
alias vim="nvim"
alias vi="nvim"
alias dev="cd ~/dev"
alias nix-shell="nix-shell --run zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
