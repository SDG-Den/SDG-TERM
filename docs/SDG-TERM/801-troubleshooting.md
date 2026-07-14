# Troubleshooting

## Hardcoded Home Paths

Some files use `/home/$(whoami)/` instead of `$HOME`:

- `other/zshrc` (lines 100, 106) — LM Studio PATH and sourcing `.zshconfig.zsh`

This breaks if the home directory is not `/home/username`. Prefer `$HOME` in these paths.

## Duplicate Aliases

The following aliases are defined in both `other/zshrc` and `other/zshconfig.zsh`:

- `update` — `sudo pacman -Syu`
- `apt` / `apt-get` — `man pacman`
- `jctl` — `journalctl -p 3 -xb`

The duplicate definitions don't cause errors (the last definition wins), but consolidating them would be cleaner.
