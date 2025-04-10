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

declare -A DOT_SUBTREES
DOT_SUBTREES[.config/nvim]="git@github.com:red4mber/nvim-config.git"

# # Naaaaah bro
# # Fuck subtrees fr fr

dot_tree() {
    local prefix=$2
    local repo="$(dirname $DOTFILES_REPO)/$(basename $prefix)-dotfiles.git"
    local branch=${3:-main}
    if 
    if [[ -z "$prefix" || -z "$repo" ]]; then
        echo "Usage: dot tree $1 <prefix> [branch]"
        return 1
    fi
    _dot subtree $1 --prefix="$prefix" "$repo" "$branch" 
}
dot_list() {
    (cd "$HOME"
    for i in $(_dot ls-files); do
        echo -n "$(_dot -c color.status=always status "$i" -s | sed "s#$i##")"
        echo -e "¬/$i¬\e[0;33m$(_dot -c color.ui=always log -1 --format="%s" -- "$i")\e[0m"
    done
    ) | column -t --separator=¬ -T 2
}

