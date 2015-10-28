source ~/.profile
source ~/.comp_specific

export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

alias la="ls -a"
alias ls="ls -F"
alias clr="tput clear"

ssh-add ~/.ssh/id_rsa
PS1="\W: \[$bldgrn\]\$git_branch\[$txtylw\]\$git_dirty\[$txtrst\]\$ "

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

# enable saving/deleting/jumping to aliased directories.
# Credits to Jeroen Janssens:
# http://jeroenjanssens.com/2013/08/16/quickly-navigate-your-filesystem-from-the-command-line.html
export MARKPATH=$HOME/.marks
function jump {
    cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}
function mark {
    mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark {
    rm -i "$MARKPATH/$1"
}
if [ `uname -s` == "Darwin" ]; then
    # Define functions a little differently on Mac
    function marks {
        \ls -l "$MARKPATH" | tail -n +2 | sed 's/  / /g' | cut -d' ' -f9- | awk -F ' -> ' '{printf "%-10s -> %s\n", $1, $2}'
    }
    _completemarks() {
        local curw=${COMP_WORDS[COMP_CWORD]}
        local wordlist=$(find $MARKPATH -type l -print0 | xargs -0 stat -f '%N' | xargs -n 1 basename)
        COMPREPLY=($(compgen -W '${wordlist[@]}' -- "$curw"))
        return 0
    }
else
    function marks {
        ls -l "$MARKPATH" | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
    }
    _completemarks() {
        local curw=${COMP_WORDS[COMP_CWORD]}
        local wordlist=$(find $MARKPATH -type l -printf "%f\n")
        COMPREPLY=($(compgen -W '${wordlist[@]}' -- "$curw"))
        return 0
    }
fi
# Add autocompletion for the jump & unmark commands
complete -F _completemarks jump unmark
