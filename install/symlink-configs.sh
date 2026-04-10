#!/usr/bin/env bash

CONFIGS_DIR="$HOME/dotfiles/configs"

for dir in "$CONFIGS_DIR"/*; do
  name=$(basename "$dir")

  # Handle lyx since it doesnt go in the normal place.
  if [[ "$name" == "lyx" ]]; then
    mkdir -p "$HOME/.lyx"
    for conf in "$dir"/*; do
      rm -rf "$HOME/.lyx/$(basename "$conf")"
      ln -nsf "$conf" "$HOME/.lyx/"
    done
  fi

  # Zsh will be handled later
  if [[ "$name" == "zsh" ]]; then
    continue
  fi

  rm -rf "$HOME/.config/$name"
  ln -sf "$dir" "$HOME/.config/$name"
done
