#!/bin/bash

LOCALDIR=SDG-TERM
DOCDIR=SDG-TERM
TIPDIR=SDG-TERM

WORKDIR=$(pwd)

rm -rf "$HOME/.local/docs/$DOCDIR" "$HOME/.local/tips/$TIPDIR" "$HOME/.local/$LOCALDIR" 2>/dev/null || true

mkdir -p "$HOME/.local/$LOCALDIR" 2>/dev/null || true
cp -r "$WORKDIR/config/"* "$HOME/.config/" 2>/dev/null || true
cp -r "$WORKDIR/local/"* "$HOME/.local/" 2>/dev/null || true
cp -r "$WORKDIR/docs/"* "$HOME/.local/docs/"
cp -r "$WORKDIR/tips/"* "$HOME/.local/tips/"

cp "$WORKDIR/other/p10k.zsh" "$HOME/.p10k.zsh"
cp "$WORKDIR/other/zshrc" "$HOME/.zshrc"
cp "$WORKDIR/other/zshconfig.zsh" "$HOME/.zshconfig.zsh"
cp "$WORKDIR/other/.distros.zsh" "$HOME/.distros.zsh"
