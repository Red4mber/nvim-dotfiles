#!/usr/bin/env bash

# === Dotfiles bare repo setup ===
DOTFILES_DIR="$HOME/.config/dotfiles/git/"
DOTFILES_REPO=$(cd ${DOTFILES_DIR} && git config --get remote.origin.url)

alias dot="git --git-dir=${DOTFILES_DIR} --work-tree=${HOME}"

dot config --local status.showUntrackedFiles no 2>/dev/null

# === dot: pretty status (thanks mitxela ❤️) ===
dot-list() {
  if [[ "$#" -eq 0 ]]; then
    (cd "$HOME"
      for i in $(dotls-files); do
        echo -n "$(dot -c color.status=always status "$i" -s | sed "s#$i##")"
        echo -e "¬/$i¬\e[0;33m$(dot -c color.ui=always log -1 --format="%s" -- "$i")\e[0m"
      done
    ) | column -t --separator=¬ -T 2
  else
    dot "$@"
  fi
}

subtree_add() {
  local prefix=$1
  local repo="$(dirname $DOTFILES_REPO)/$(basename $prefix)-dotfiles.git"
  local branch=${2:-main}

  if [[ -z "$prefix" || -z "$repo" ]]; then
    echo "Usage: subtree_add <target-path> [branch]"
    return 1
  fi

  echo "➕ Adding subtree: $prefix ← $repo ($branch)"
  dot subtree add --prefix="$prefix" "$repo" "$branch" --squash
}

# === Subtree: add a new config repo into your dotfiles ===
dot_add_subtree() {
  local prefix=$1
  local repo=$2
  local branch=${3:-main}

  if [[ -z "$prefix" || -z "$repo" ]]; then
    echo "Usage: dot_add_subtree <prefix-path> <repo-url> [branch]"
    return 1
  fi

  echo "➕ Adding subtree: $prefix ← $repo ($branch)"
  dot subtree add --prefix="$prefix" "$repo" "$branch" --squash
}

# === Subtree: pull (update) from upstream ===
dot_pull_subtree() {
  local prefix=$1
  local repo=$2
  local branch=${3:-main}

  if [[ -z "$prefix" || -z "$repo" ]]; then
    echo "Usage: dot_pull_subtree <prefix-path> <repo-url> [branch]"
    return 1
  fi

  echo "🔄 Pulling subtree: $prefix ← $repo ($branch)"
  dot subtree pull --prefix="$prefix" "$repo" "$branch" --squash
}

# === Subtree: push changes back upstream ===
dot_push_subtree() {
  local prefix=$1
  local repo=$2
  local branch=${3:-main}

  if [[ -z "$prefix" || -z "$repo" ]]; then
    echo "Usage: dot_push_subtree <prefix-path> <repo-url> [branch]"
    return 1
  fi

  echo "📤 Pushing subtree: $prefix → $repo ($branch)"
  dot subtree push --prefix="$prefix" "$repo" "$branch"
}

