source ~/.profile
source ~/.comp_specific

alias la="ls -a"
alias ls="ls -F"
alias clr="tput clear"

ssh-add ~/.ssh/id_rsa
PS1='\W:$ '

set -o ignoreeof
shopt -s extglob


# Allows easy search for files of inputted name
function search() {
    sudo /usr/bin/find . -name "$@" -print;
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export MANPATH=/usr/local/man:$MANPATH

# enable color support
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
