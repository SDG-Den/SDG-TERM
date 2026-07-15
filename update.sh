#!/bin/bash

WORKDIR="$HOME/.cache/SDG-PKG/sdg-term"

rm -rf "$HOME/.local/docs/SDG-TERM" "$HOME/.local/tips/SDG-TERM"
cp -r "$WORKDIR/docs/"* "$HOME/.local/docs/"
cp -r "$WORKDIR/tips/"* "$HOME/.local/tips/"

cp -r "$WORKDIR/other/p10k.zsh" "$HOME/.p10k.zsh"
cp -r "$WORKDIR/other/zshrc" "$HOME/.zshrc"
cp -r "$WORKDIR/other/zshconfig.zsh" "$HOME/.zshconfig.zsh"
cp -r "$WORKDIR/other/.distros.zsh" "$HOME/.distros.zsh"
