## git aliases
function gcommit { git commit -m "$@"; }
## add explicity alias so I can search it with alias
function gclean () { git branch -d $(git branch --merged=master | grep -v master); git fetch prune; }
alias gc="gcommit";

alias gs="git status";
alias gp="git pull";
alias gup="git push -u origin ${vcs_info_msg_0_}";
alias gf="git fetch";
alias gpush="git push";
alias updates="git diff -- . ':(exclude)*-lock.json'";
alias changes="git diff --stat -- .";
alias ga="git add .";
alias switch="git switch";
alias glone="gh repo clone";
alias diff='delta'
alias graph="git log --graph --pretty='%C(bold blue) Hash: %h %C(cyan)(%ar) %C(red) %s'";
alias gcsm="git commit -S -m"
alias gcsma="git add $1 && git commit -S -m $2"

#** cd to the project root and graph the git tree
function groot { 
  if git remote -v; 
    ROOT_DIR=`git rev-parse --show-top-level`
  then 
    cd $ROOT_DIR && git log --graph --pretty="%C(bold blue) Hash: %h %C(cyan)(%ar) %C(red) %s"; 
  else
    # not a git repo
    return 1
  fi
}

function branch-trim {
  if git branch -v;
  then
    git branch --merged | egrep -v "(^\*|prd|dev)" | xargs git branch -d; return 0
  else
    return 1
  fi
}

#** rt is git alias to git rev-parse --show-top-level **
function root { cd $( git rt ) }

# npm aliases
alias initn="npm init";
alias nr="npm run";
alias nrt="npm run test";
alias nrb="npm run build";

# terraform
alias initt="terraform init";
alias inittu="terraform init -upgrade";
alias plan-t="terraform plan";
alias tapply="terraform plan -apply";

# eza ls
alias ld="eza -lD";
alias lf="eza -lF --color=always | grep -v /";
alias lh="eza -dl .* --group-directories-first";
alias ls="eza -a --group-directories-first";
alias l="ls";
alias ll="eza -alF --color=always --sort=size";
alias lt="eza -al --sort=modified -F -T";

# zle stuff
alias ..="cd ../"
alias ..w="cd ~/work"
alias ...="cd ~/"
alias ..l="cd ../ && ll"
alias dev="cd ~/dev"

# vim alias
alias ,="nvim"
alias vim="nvim"
alias vi="nvim"
alias vz="vi ~/.zshrc"
alias sz=". ~/.zshrc"
alias salias=". ~/rucksack/.zsh_aliases"
alias cpz="rm -i ~/rucksack/.zshrc cp ~/.zshrc rucksack/"
alias sack="rm -irf ~/rucksack cp ~/.zshrc rucksack/"
alias ruck="rm -irf ~/.config/ cp ~/rucksack/.config ~/.config"


# All the important functions (print them to term and copy them)
d() { 
  EYES=" ಠ_ಠ "
  printf "%s" $EYES | tee /dev/tty | pbcopy && printf "\n";
}

f() { 
  TABLE="（╯°□°）╯ ┻━┻"
  printf "%s" $TABLE | tee /dev/tty | pbcopy && printf "\n";
}

s() { SHRUG="¯\_(ツ)_/¯"
  printf "%s" $SHRUG | tee /dev/tty | pbcopy && printf "\n";
}

function curl-cert() {
  openssl s_client -showcerts -connect "${1}":443 -servername ${1}
}

function awsp() {
    export AWS_PROFILE=$(grep profile ${HOME}/.aws/config \
        | awk '{print $2}' | sed 's,],,g' \
        | fzf --layout reverse --height=10% --border)
}

function fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" \
  | fzf --ansi --preview "echo {} \
    | grep -o '[a-f0-9]\{7\}' \
    | head -1 \
    | xargs -I % sh -c 'git show --color=always %'" \
        --bind "enter:execute:
            (grep -o '[a-f0-9]\{7\}' \
                | head -1 \
                | xargs -I % sh -c 'git show --color=always % \
                | less -R') << 'FZF-EOF'
            {}
FZF-EOF"
}

function decode_base64_url() {
  local len=$((${#1} % 4))
  local result="$1"
  if [ $len -eq 2 ]; then result="$1"'=='
  elif [ $len -eq 3 ]; then result="$1"'=' 
  fi
  echo "$result" | tr '_-' '/+' | openssl enc -d -base64
}

function decode_jwt(){
   decode_base64_url $(echo -n $2 | cut -d . -f $1) | jq .
}

# Decode JWT header
alias jwth="decode_jwt 1"

# Decode JWT Payload
alias jwtp="decode_jwt 2"
