# SDG-TERM Migration Plan

## Directory Mapping

| Source | Installed to |
|--------|-------------|
| `config/ghostty/` | `~/.config/ghostty/` |
| `other/zshrc` | `~/.zshrc` |
| `other/zshconfig.zsh` | `~/.local/SDG-TERM/zshconfig.zsh` |
| `other/p10k.zsh` | `~/.p10k.zsh` |
| `tips/` | `~/.local/tips/SDG-TERM/` |
| `docs/` | `~/.local/docs/SDG-TERM/` |

## Path Rewrites

### config/ghostty/config.ghostty — 2 cross-module references

| Old | New | Target |
|-----|-----|--------|
| `~/.config/sdgos/fastfetch/fetch.sh` | `~/.local/SDG-FETCH/fetch.sh` | SDG-FETCH |
| `~/.config/sdgos/tips/tips.sh` | `~/.local/SDG-TIPS/tips.sh` | SDG-TIPS |

### other/zshconfig.zsh — 12 cross-module alias references

| Old alias path | New path | Target |
|----------------|----------|--------|
| `~/.config/sdgos/tips/tips.sh` | `~/.local/SDG-TIPS/tips.sh` | SDG-TIPS |
| `~/.config/sdgos/tips/tips.list` | `~/.local/tips/SDG-TIPS/tips.list` | SDG-TIPS data |
| `~/.config/sdgos/fastfetch/fetch.sh` | `~/.local/SDG-FETCH/fetch.sh` | SDG-FETCH |
| `~/.config/sdgos/fastfetch/fetch-conf.sh` | `~/.local/SDG-FETCH/fetch-conf.sh` | SDG-FETCH |
| `~/.config/sdgos/tuis/pkg-install.sh` | `~/.local/SDG-UTILS/pkg-install.sh` | SDG-UTIL-SCRIPTS |
| `~/.config/sdgos/tuis/aur-install.sh` | `~/.local/SDG-UTILS/aur-install.sh` | SDG-UTIL-SCRIPTS |
| `~/.config/sdgos/tuis/project.select.sh` | `~/.local/SDG-UTILS/project-select.sh` | SDG-UTIL-SCRIPTS |
| `~/.config/sdgos/mango-config.sh` | `~/.local/SDG-MANGO-CONF/mango-config.sh` | SDG-MANGO-HELPERS |
| `~/.config/sdgos/tuis/documentation.sh` | `~/.local/SDG-UTILS/documentation.sh` | SDG-UTIL-SCRIPTS |
| `~/.config/sdgos/help/cmd-help.sh` | `~/.local/SDG-HELP/cmd-help.sh` | SDG-UTIL-SCRIPTS |
| `~/.config/sdgos/help/help.sh` | `~/.local/SDG-HELP/help.sh` | SDG-UTIL-SCRIPTS |

Also fix the alias name typo: `project.select.sh` → `project-select.sh`.

### other/zshrc — hardcoded paths

| Old | New |
|-----|-----|
| `/home/$(whoami)/.lmstudio/bin` | `$HOME/.lmstudio/bin` (or conditional check) |
| `/home/$(whoami)/.config/sdgos/zshconfig.zsh` | `$HOME/.local/SDG-TERM/zshconfig.zsh` |

## Lifecycle Scripts

All four root-level scripts are empty. Implement:

- **install.sh**: Backup existing `~/.zshrc`, `~/.p10k.zsh`. Deploy configs. Copy `other/` files to their destinations. Copy docs/tips.
- **uninstall.sh**: Remove deployed files, restore backups.
- **update.sh**: Re-deploy with backup.
- **detect.sh**: Check `ghostty`, `zsh`, `oh-my-zsh`, `powerlevel10k`.

## Ghostty Config Name

Ghostty expects config at `~/.config/ghostty/config` (no extension). The repo has `config.ghostty`. The install script should rename: `cp config/ghostty/config.ghostty ~/.config/ghostty/config`.

## Modular Tips

- Create `tips/` with ghostty keybinds, zsh aliases, Powerlevel10k customization tips.

## Modular Docs

- Create `docs/` documenting the terminal setup.

## Cleanup

- Remove `config/ghostty/themes/dankcolors (conflicted copy ...)` — git merge artifact
- Remove empty `cache/`, `other/` (keep zshrc, zshconfig.zsh, p10k.zsh)
