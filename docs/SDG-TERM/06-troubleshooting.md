# Troubleshooting

## Hardcoded Home Paths

Some files use `/home/$(whoami)/` instead of `$HOME`:

- `other/zshrc` (lines 100, 106) — LM Studio PATH and sourcing `.zshconfig.zsh`

This breaks if the home directory is not `/home/username`. Prefer `$HOME` in these paths.

## Ghostty Config Filename

In this repository, the Ghostty config is named `config.ghostty` to prevent editor conflicts and syntax highlighting issues. When deployed, it must be renamed to `config` (no extension). The install script handles this automatically.

## Duplicate Aliases

The following aliases are defined in both `other/zshrc` and `other/zshconfig.zsh`:

- `update` — `sudo pacman -Syu`
- `apt` / `apt-get` — `man pacman`
- `jctl` — `journalctl -p 3 -xb`

The duplicate definitions don't cause errors (the last definition wins), but consolidating them would be cleaner.

## Missing detect.sh

There is no `detect.sh` script in the repository. This file would be used to detect whether SDG-TERM is installed on the system.
