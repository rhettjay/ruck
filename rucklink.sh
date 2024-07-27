#!/bin/zsh

while IFS="" read -r pkg || [[ -n "$pkg" ]]; do
  if [[ ! -d "$pkg" || ! -d ".config/$pkg" ]]; then
    printf "Warning: No config for %s \n" $pkg
    exit 1
  fi
  if [[ "$pkg" == "zsh" ]]; then
    printf "Linking .zsh\n"
    ln -s .zshrc ~/.zshrc && \
    ln -s .zsh/ ~/.zsh
  fi
  ln -s "./.config/$pkg" "~/.config/"
done < ruck.conf
