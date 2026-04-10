#!/usr/bin/env bash
set -e

USER="$(whoami)"
echo "Cloning the repo into $HOME/dotfiles"
git clone "https://github.com/eitankushnir/dotfiles" "$HOME/dotfiles"

cd "$HOME/dotfiles/install" || exit

echo "Installing yay"
bash ./install-yay.sh

cd "$HOME/dotfiles/install" || exit

echo "Installing Packages from pkgs.txt and pkgs-aur.txt"
bash ./install-pkgs.sh

cd "$HOME/dotfiles/install" || exit

echo "Creating symlinks for all applications in the configs directory"
bash ./symlink-configs.sh

cd "$HOME/dotfiles/install" || exit

echo "Setting up zsh with oh my zsh"
bash ./install-zsh.sh

cd "$HOME/dotfiles/install" || exit

echo "Done with all the confis."

echo "Setting up wallpapers switcher"
awww-daemon &
export PATH="$PATH:/$HOME/dotfiles/bin"
bgswapper rnd

cd "$HOME/dotfiles/install" || exit
echo "Enabling groups and services"
./services-and-groups.sh "$USER"

echo "Dont forget to install TexLive"
echo "Dont forget to install Steam"
echo "Dont forget to install gpu drivers"
echo "Rebooting in 5 seconds..."

sleep 5

reboot
