#!/bin/bash

#dependencies
unipkg install any ghostty
unipkg install any zsh-history-substring-search
unipkg install any zsh-syntax-highlighting
unipkg install any zsh-autosuggestions
unipkg install any zsh-doc
unipkg install any zsh
unipkg install any zsh-theme-powerlevel10k
unipkg install any zoxide
unipkg install any eza

# set working directory
WORKDIR=/home/$(whoami)/.cache/SDG-PKG/sdg-term


# move old config
mv ~/.config/ghostty ~/.config/ghostty-old-$RAND
mv ~/.zshrc ~/.zshrc-old-$RAND
mv ~/.p10k.zsh ~/.p10k-old-$RAND

# install default configs
cp -r $WORKDIR/config/* /home/$(whoami)/.config


# install docs and tips
mkdir -p /home/$(whoami)/.local/docs
mkdir -p /home/$(whoami)/.local/tips
cp -r $WORKDIR/docs/* /home/$(whoami)/.local/docs
cp -r $WORKDIR/tips/* /home/$(whoami)/.local/tips


# install zsh config
cp -r $WORKDIR/other/p10k.zsh /home/$(whoami)/.p10k.zsh
cp -r $WORKDIR/other/zshrc /home/$(whoami)/.zshrc
cp -r $WORKDIR/other/zshconfig.zsh /home/$(whoami)/.zshconfig.zsh

