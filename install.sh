#!/bin/bash

### dependencies
unipkg install any ghostty
unipkg install any zsh-history-substring-search
unipkg install any zsh-syntax-highlighting
unipkg install any zsh-autosuggestions
unipkg install any zsh-doc
unipkg install any zsh
unipkg install any zsh-theme-powerlevel10k
unipkg install any zoxide
unipkg install any eza

WORKDIR="$HOME/.cache/SDG-PKG/sdg-term"

# backup old configs
mv "$HOME/.config/ghostty" "$HOME/.config/ghostty-old-$RANDOM"
mv "$HOME/.zshrc" "$HOME/.zshrc-old-$RANDOM"
mv "$HOME/.p10k.zsh" "$HOME/.p10k-old-$RANDOM"

cp -r "$WORKDIR/config/"* "$HOME/.config/"
cp -r "$WORKDIR/docs/"* "$HOME/.local/docs/"
cp -r "$WORKDIR/tips/"* "$HOME/.local/tips/"

# install zsh config
cp -r "$WORKDIR/other/p10k.zsh" "$HOME/.p10k.zsh"
cp -r "$WORKDIR/other/zshrc" "$HOME/.zshrc"
cp -r "$WORKDIR/other/zshconfig.zsh" "$HOME/.zshconfig.zsh"
