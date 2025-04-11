#!/usr/bin/env bash

DOTFILES_DIR="$HOME/.config/dotfiles/git/"
DOTFILES_REPO=$(cd ${DOTFILES_DIR} && git config --get remote.origin.url)

alias _dot="git --git-dir=${DOTFILES_DIR} --work-tree=${HOME}"
_dot config --local status.showUntrackedFiles no 2>/dev/null

dot() {
    case $1 in
        tree)
            shift
            dot_tree "$@"
            ;;
        list | ls)
            dot_list
            ;;
        *)
            _dot "$@"
            ;;
    esac
}

dot_tree() {
    if [ $# -ge 2 ]; then
        local command="$1"
        local prefix="$2"
        local repo="$(dirname $DOTFILES_REPO)/$(basename $prefix)-dotfiles.git"
        others=""
        while shift && [ -n "$2" ]; do
            others="${others} $2"
        done 
        # local branch=${3:-main}
        local branch="main"
    else 
        echo "Usage: dot tree $1 <prefix> [other arguments]" #[branch]"
        return 1
    fi
    # echo "_dot subtree $command --prefix=$prefix $repo $branch $others[@]" # debug 
    # echo _dot subtree "${command}" --prefix="${prefix}" \""${repo}"\" \""${branch}"\" "${others[@]}"  
    _dot subtree "${command}" --prefix="${prefix}" \""${repo}"\" \""${branch}"\" ${others[@]}  
}


dot_list() {
    (cd "$HOME"
    for i in $(_dot ls-files); do
        echo -n "$(_dot -c color.status=always status "$i" -s | sed "s#$i##")"
        echo -e "¬/$i¬\e[0;33m$(_dot -c color.ui=always log -1 --format="%s" -- "$i")\e[0m"
    done
    ) | column -t --separator=¬ -T 2
}

