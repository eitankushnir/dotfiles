#!/usr/bin/env bash
LIST_LOC="$HOME/dotfiles/install/pkgs.txt"
LIST_AUR_LOC="$HOME/dotfiles/install/pkgs-aur.txt"

PKGS=$(sed 's/#.*//' "$LIST_LOC" | xargs)
PKGS_AUR=$(sed 's/#.*//' "$LIST_AUR_LOC" | xargs)

if [[ -n "$PKGS" ]]; then
  echo "Installing packages from official repos..."
  sudo pacman -S --noconfirm --needed $PKGS
else
  echo "No official packages to install. Skipping step..."
fi

if [[ -n "$PKGS_AUR" ]]; then
  echo "Installing packages from aur..."
  yay -S --noconfirm --needed $PKGS_AUR
else
  echo "No aur packages to install. Skipping step..."
fi
