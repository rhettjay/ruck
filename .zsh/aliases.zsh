## git aliases
function gcommit { git commit -m "$@"; }
## add explicity alias so I can search it with alias
function gclean () { git branch -d $(git branch --merged=master | grep -v master); git fetch prune; }
alias gc="gcommit";
alias gcsm="git commit -S -m"
function gcsma() {
    git add $1 && git commit -S -m $2
}
alias gs="git status";
alias gitup="git push -u origin ${vcs_info_msg_0_}";
alias gitul="git pull"
alias gitf="git fetch";
alias updates="git diff -- . ':(exclude)*-lock.json'";
alias changes="git diff --stat -- .";
alias switch="git switch";
alias jlone="jj git clone https://github.com/$1";
# Keeping glone around in case I have a hard time adapting to the new pattern.
# This way if I ever migrate all the way to jj then clone will not need a mental remap.
alias clone="gh repo clone";
alias glone="gh repo clone";
alias diff='delta'
alias graph="git log --graph --pretty='%C(bold blue) Hash: %h %C(cyan)(%ar) %C(red) %s'";
alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

## ! first run of this caused term pane to crash
# function gh() {
#   GH_ORG=""
#   if [[ $1 == "init" ]]
#   then
#     shift 1; command gh repo create "$@"
#     exit 0
#   else
#     shift 1; command gh "$@"
#     exit 0
#   fi
# }
# function gh() {
#   GH_ORG=""
#   while getops ":init*:" opt
#   do
#   case $opt in
#     "init-oit" ) shift $((OPTIND -2)); GH_ORG="$OPTARG" "$@" | more ;;
#     "init-rhettjay" ) shift $((OPTIND -2)); command gh create repo "rhettjay/$OPTARG" "$@"| more ;;
#     "init-trn" ) shift $((OPTIND -2)); command gh create repo "byu-oit-training/$OPTARG" "$@"| more ;;
#     * ) command gh "$@" ;;
#   esac
# }

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
alias ls="eza -a --group-directories-first --icons=always --hyperlink";
alias l="ls";
alias ll="eza -alF --color=always --sort=size --icons=always --hyperlink";
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
alias rriimm="nvim ~/ruck/."
alias vviimm="nvim ~/ruck/.config/nvim"
alias vimdiff="nvim -d"
alias vdiff="nvim -d"
alias vi="nvim"
alias vz="vi ~/.zshrc"
alias sz=". ~/.zshrc"
alias salias=". ~/rucksack/.zsh_aliases"
alias cpz="rm -i ~/rucksack/.zshrc cp ~/.zshrc rucksack/"
alias sack="rm -irf ~/rucksack cp ~/.zshrc rucksack/"
alias ruck="rm -irf ~/.config/ cp ~/rucksack/.config ~/.config"

# Docker / Podman
alias pod="podman"

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
alias k="kubectl"
