#!/usr/bin/env bash

DOTFILES_DIR="$HOME/.config/dotfiles/git/"
DOTFILES_REPO=$(cd ${DOTFILES_DIR} && git config --get remote.origin.url)

alias _dot="git --git-dir=${DOTFILES_DIR} --work-tree=${HOME}"
_dot config --local status.showUntrackedFiles no 2>/dev/null

dot() {
    case $1 in
        subtree | tree)
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
    local prefix=$2
    local repo="$(dirname $DOTFILES_REPO)/$(basename $prefix)-dotfiles.git"
    local branch=${3:-main}
    if [[ -z "$prefix" || -z "$repo" ]]; then
        echo "Usage: dot tree $1 <prefix> [branch]"
        return 1
    fi
    _dot subtree $1 --prefix="$prefix" "$repo" "$branch" --squash
}

dot_list() {
    (cd "$HOME"
    for i in $(_dot ls-files); do
        echo -n "$(_dot -c color.status=always status "$i" -s | sed "s#$i##")"
        echo -e "¬/$i¬\e[0;33m$(_dot -c color.ui=always log -1 --format="%s" -- "$i")\e[0m"
    done
    ) | column -t --separator=¬ -T 2
}
# dot-list() {
#   if [[ "$#" -eq 0 ]]; then
#     (cd "$HOME"
#       for i in $(dotls-files); do
#         echo -n "$(dot -c color.status=always status "$i" -s | sed "s#$i##")"
#         echo -e "¬/$i¬\e[0;33m$(dot -c color.ui=always log -1 --format="%s" -- "$i")\e[0m"
#       done
#     ) | column -t --separator=¬ -T 2
#   else
#     dot "$@"
#   fi
# }
