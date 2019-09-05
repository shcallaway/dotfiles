[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

source $(brew --prefix)/etc/bash_completion.d/git-completion.bash
source <(kubectl completion bash)
source ~/.bash_completion

alias k=kubectl
alias g=git
alias d=docker
alias dc=docker-compose
alias cat=bat
alias kctx=kubectx
alias kns=kubens
alias tf=terraform

complete -F _complete_alias k
complete -F _complete_alias g
complete -F _complete_alias cat

# Need to enable bash completion before setting up alias completion.
# complete -F _complete_alias dc
# complete -F _complete_alias d

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~"

COLOR_RED="\e[1;31m"
COLOR_BLUE="\e[1;34m"
COLOR_RESET="\e[0;0m"
COLOR_YELLOW="\e[1;33m"
COLOR_GREEN="\e[1;32m"
COLOR_PURPLE="\e[1;5;95m"
COLOR_RESET="\e[0;0m"
COLOR_GREY="\e[1;90m"
COLOR_WHITE="\e[1;97m"

function git_branch() {
  BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  test -n "$BRANCH" && echo -e "[git:$BRANCH]" || echo -e "[git:]"
}

function git_color() {
  STATUS=`git status 2> /dev/null`
  
  # The order matters very much here. If there any staged changes, the prompt should be green.
  # If there no staged changes, and there are unstaged changes, the prompt should be red.
  # If there are no staged or unstaged changes, and your local branch is ahead of its remote counterpart,
  # the prompt should be yellow. Otherwise, it should be white.
  if [[ $STATUS =~ "Changes to be committed" ]]; then
    echo -e $COLOR_GREEN
  elif [[ $STATUS =~ "Changes not staged for commit" ]]; then
    echo -e $COLOR_RED
  elif [[ $STATUS =~ "Your branch is ahead of" ]]; then
    echo -e $COLOR_YELLOW
  else
    echo -e $COLOR_WHITE
  fi
}

function kube_context() {
  CTX=$(kubectl config current-context)
  test -n "$CTX" && echo -e "[kctx:$CTX]" || echo -e "[kctx:]"
}

function kube_namespace() {
  CTX=$(kubectl config current-context)
  NS=$(kubectl config view -o json | jq -r --arg context $CTX '.contexts[] | select(.name==$context) | .context.namespace')
  test -n "$NS" && echo -e "[kns:$NS]" || echo -e "[kns:]"
}

function tf_workspace() {
  WKSP=$(cat .terraform/environment 2>/dev/null)
  test -n "$WKSP" && echo -e "[tf:$WKSP]" || echo -e "[tf:]"
}

# Colors are non-printing escape sequences.
# If you don't wrap them in \[\], Bash will allocate space for them on the screen.
# http://mywiki.wooledge.org/BashFAQ/053
BASE_PROMPT="\[$COLOR_WHITE\]\u \w\[$COLOR_RESET\]"
GIT_PROMPT="\[\$(git_color)\]\$(git_branch)\[$COLOR_RESET\]"
KUBE_PROMPT="\[$COLOR_BLUE\]\$(kube_context) \$(kube_namespace)\[$COLOR_RESET\]"
TF_PROMPT="\[$COLOR_PURPLE\]\$(tf_workspace)\[$COLOR_RESET\]"

export PS1="$BASE_PROMPT $GIT_PROMPT $KUBE_PROMPT $TF_PROMPT "

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

