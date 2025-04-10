#!/usr/bin/env bash

set -e 

REPO_URL="git@github.com:red4mber/dotfiles.git"

DOTFILES_DIR="${HOME}/.config/dotfiles"
REPO_DIR="${DOTFILES_DIR}/git"
BACKUP_DIR="${DOTFILES_DIR}/backup"

# === Cloning the repository ===
#
if [ ! -d "$DOTFILES_DIR" ]; then
  mkdir -p "$DOTFILES_DIR"
fi
if [ ! -d "$REPO_DIR" ]; then
  git clone --bare "$REPO_URL" "$REPO_DIR"
else
  echo "[?-?] Dotfiles repo already exists at $REPO_DIR"
fi

# == Main Alias ==
function dotfiles {
  /usr/bin/git --git-dir="${REPO_DIR}" --work-tree="${HOME}" "$@"
}

# === BACKUP ===

# Backup a file 
function backup {
    local file=$1
    mkdir -p "$(dirname "${BACKUP_DIR}/${file}")"
    mv "${HOME}/${file}" "${BACKUP_DIR}/${file}" 2>/dev/null || true
}

# Create the necessary folder if it doesn't exist
if [ ! -d "${BACKUP_DIR}" ]; then
    mkdir -p $BACKUP_DIR
fi

# === Backup existing config ===
echo "[^-^] Backing up existing dotfiles to ${BACKUP_DIR}"
dotfiles checkout 2>&1 | grep -E "\s+\." | awk '{print $1}' | while read -r file; do
    mkdir -p "$(dirname "${BACKUP_DIR}/${file}")"
    mv "${HOME}/${file}" "${BACKUP_DIR}/${file}" 2>/dev/null || true
done


# === Checkout the actual dotfiles ===
echo "[^-^] Checking out dotfiles"
dotfiles checkout

# === Set Git to not show untracked files ===
dotfiles config --local status.showUntrackedFiles no

# bash by default, or zsh if it exists
SHELL_RC="${HOME}/.bashrc"
[ -n "${ZSH_VERSION}" ] && SHELL_RC="${HOME}/.zshrc"

# Install dotfiles in the config if not already present
if grep -q "source ${DOTFILES_DIR}/dotfiles.sh" $SHELL_RC
then
    echo  "source ${DOTFILES_DIR}/dotfiles.sh" >> $SHELL_RC
else
    echo "[?-?] dotfiles was already in your config !"
fi

echo "[^v^] Done! Please restart your shell or run 'source ${SHELL_RC}' to activate aliases."

