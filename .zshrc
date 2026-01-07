ZDOTDIR=~/.zsh
# Load zprof if you're seeing slowness to figure out why
# zmodload zsh/zprof

autoload -Uz compinit

ZCOMPDUMP="${XDG_CACHE_HOME:-$HOME/.cache}/zcompdump-$ZSH_VERSION"
mkdir -p "${ZCOMPDUMP:h}"

# If dump is older than 24h, rebuild; else use cache
if [[ ! -f "$ZCOMPDUMP" || $(find "$ZCOMPDUMP" -mtime +1 -print 2>/dev/null) != "" ]]; then
  compinit -d "$ZCOMPDUMP"
else
  compinit -C -d "$ZCOMPDUMP"
fi

source "$ZDOTDIR/opt.zsh"
source "$ZDOTDIR/env.zsh"
source "$ZDOTDIR/aliases.zsh"

# zprof
