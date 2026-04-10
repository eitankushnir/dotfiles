#!/usr/bin/env bash
USER="$(whoami)"
echo "Cloning the repo into $HOME/dotfiles"
if [[ -d "$HOME/dotfiles" ]]; then
  rm -rf "$HOME/dotfiles"
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
generate-colors "$HOME/dotfiles/wallpapers/cool-lighthouse.png"
mkdir -p "$HOME/dotfiles/current"
ln -nsf "$HOME/dotfiles/themes/matugen" "$HOME/dotfiles/current/theme"

echo "Enabling groups and services"
bash "$HOME/dotfiles/install/services-and-groups.sh"

echo "Dont forget to install TexLive"
echo "Dont forget to install Steam"
echo "Dont forget to install gpu drivers"
echo "Rebooting in 5 seconds..."

sleep 5

reboot
