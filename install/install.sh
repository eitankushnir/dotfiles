#!/usr/bin/env bash
set -e

USER="$(whoami)"
echo "Cloning the repo into $HOME/dotfiles"
if [[ -d "$HOME/dotfiles" ]]; then
  mv -f "$HOME/dotfiles" "$HOME/dotfiles.bak"
fi

git clone "https://github.com/eitankushnir/dotfiles" "$HOME/dotfiles"

echo "Installing yay"
bash "$HOME/dotfiles/install/install-yay.sh"

echo "Installing Packages from pkgs.txt and pkgs-aur.txt"
bash "$HOME/dotfiles/install/install-pkgs.sh"

echo "Creating symlinks for all applications in the configs directory"
bash "$HOME/dotfiles/install/symlink-configs.sh"

echo "Setting up zsh with oh my zsh"
bash "$HOME/dotfiles/install/install-zsh.sh"

echo "Done with all the confis."

echo "Setting up wallpapers switcher"
awww-daemon &
export PATH="$PATH:/$HOME/dotfiles/bin"
bgswapper rnd

echo "Enabling groups and services"
bash "$HOME/dotfiles/install/services-and-groups.sh"

echo "Dont forget to install TexLive"
echo "Dont forget to install Steam"
echo "Dont forget to install gpu drivers"
echo "Rebooting in 5 seconds..."

sleep 5

reboot
