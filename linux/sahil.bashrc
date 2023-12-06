# show colorful prompt and also show the current git branch if applicable
function color_my_prompt {
    local __user="\[\033[01;32m\]\u"
    local __host='`hostname | sed -E s/.deshaw.com//`'
    local __cur_location="\[\033[01;34m\]\w"
    local __git_branch_color="\[\033[31m\]"
    local __git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
    local __prompt_tail="\[\033[35m\]$"
    local __last_color="\[\033[00m\]"
    local __titlebar='\[\e]0;\u@\h\a\]'
    export PS1="${__titlebar}$__user@$__host:$__cur_location:$__git_branch_color$__git_branch$__prompt_tail$__last_color "
}
color_my_prompt
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# This add notification when command completes in GNOME Terminal
source /etc/profile.d/vte.sh

#Aliases
alias vi=vim

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Git commands shortcuts
alias gd='git diff'
alias gds='git diff --cached --ignore-space-at-eol -b -w --ignore-blank-lines'
alias gdt='git difftool'
alias gs='git status'
alias gco='git checkout'
alias gcom='gco master'
alias gp='git pull'
alias gb='git branch'
alias gst='git stash'
alias gstp='git stash pop'

alias ack='ack --ignore-dir target/ --ignore-dir .idea --ignore-dir build --ignore-dir dist'
alias find_core_files="find . -name 'core.[[:digit:]]*' -type f"
alias find_core_files_2="find . -regextype posix-extended -regex '^.*core\.[0-9]*'"
alias find_without_node_modules='find . -type d \( -name build -o -name dist -o -name node_modules \) -prune -false -o -name'

alias file_server="python3 -m http.server 0"
alias rsyncp="rsync --info=progress2"
alias vscode="code"

list_descendants ()
{
  local children=$(ps -o pid= --ppid "$1")

  for pid in $children
  do
    list_descendants "$pid"
  done

  echo "$children"
}

kill_tree() {
    kill $2 `pstree -p $1 | grep -oP '(?<=\()[0-9]+(?=\))'`
}

file_ansi_output() {
    command=$@
    script --flush --quiet --return /tmp/output.ansi --command "$command"
}

alias gitlab_curl='curl --header "PRIVATE-TOKEN: $GITLAB_TOKEN"'

# https://github.com/cykerway/complete-alias
if [[ $PS1 && -f /usr/share/bash-completion/bash_completion ]]
then
    . $HOME/private/github/bashrc-file/bash_completion.d/complete_alias
fi
# Add this to end of actual bashrc - complete -F _complete_alias "${!BASH_ALIASES[@]}"

# https://github.com/gradle/gradle-completion
# source $HOME/private/github/bashrc-file/bash_completion.d/gradle-completion.bash

subdir() {
    command=$@
    find . -mindepth 1 -maxdepth 1 -type d -print -exec git -C {} "$command" \;
}
