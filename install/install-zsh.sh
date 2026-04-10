#!/usr/bin/env bash

if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  echo "Installing Oh My Zsh"
  RUNZSH=no CHSH=yes KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "Oh My Zsh already installed"
fi

echo "Copying configs over"
for file in ".zshrc" ".p10k.zsh" ".zshenv"; do
  rm "$HOME/$file"
  ln -sf "$HOME/dotfiles/configs/zsh/$file" "$HOME/$file"
done

echo "Installing plugings"
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting

echo "Installing theme"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

echo "Finished with zsh setup"
