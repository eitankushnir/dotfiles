#!/usr/bin/env bash

cd "$HOME" || exit 1
git clone https://aur.archlinux.org/yay.git
cd yay || exit 1
makepkg -si
