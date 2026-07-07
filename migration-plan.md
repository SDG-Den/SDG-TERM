# SDG-TERM Migration Plan

## 1. Implement Lifecycle Scripts

All four root-level lifecycle scripts are **empty stubs** — must be implemented:

| Script | Purpose |
|--------|---------|
| `install.sh` | Deploy `config/ghostty/` → `~/.config/ghostty/`, deploy `other/zshrc` → `~/.zshrc`, deploy `other/zshconfig.zsh` → `~/.config/sdgos/zshconfig.zsh`, deploy `other/p10k.zsh` → `~/.p10k.zsh`, backup existing dotfiles |
| `uninstall.sh` | Remove all deployed configs, restore backups |
| `update.sh` | Overwrite configs, preserve user modifications |
| `detect.sh` | Check for `ghostty`, `zsh`, `oh-my-zsh`, `powerlevel10k` |

## 2. Path Audit — Hardcoded `/home/$(whoami)/`

### 2.1 `other/zshrc` — line 100
```bash
export PATH="$PATH:/home/$(whoami)/.lmstudio/bin"
```
- Change to: `export PATH="$PATH:$HOME/.lmstudio/bin"`.
- Or better: use a conditional `[[ -d "$HOME/.lmstudio/bin" ]] && export PATH="$PATH:$HOME/.lmstudio/bin"`.

### 2.2 `other/zshrc` — line 106
```bash
source /home/$(whoami)/.config/sdgos/zshconfig.zsh
```
- Change to: `source ~/.config/sdgos/zshconfig.zsh`.
- Or: `source "$HOME/.config/sdgos/zshconfig.zsh"`.

## 3. Cross-module References

### 3.1 `config/ghostty/config.ghostty` — line 7
```bash
initial-command = /bin/zsh -c ~/.config/sdgos/fastfetch/fetch.sh && echo "" && ~/.config/sdgos/tips/tips.sh && ...
```
References:
- `~/.config/sdgos/fastfetch/fetch.sh` — from SDG-FETCH
- `~/.config/sdgos/tips/tips.sh` — from SDG-TIPS

### 3.2 `other/zshconfig.zsh` — cross-module aliases
```zsh
alias tipme='~/.config/sdgos/tips/tips.sh'                    # SDG-TIPS
alias alltips='cat ~/.config/sdgos/tips/tips.list | fzf'      # SDG-TIPS
alias cowtip='cowsay -r $(shuf -n 1 ~/.config/sdgos/tips/tips.list) | lolcat'  # SDG-TIPS
alias fetch='~/.config/sdgos/fastfetch/fetch.sh'               # SDG-FETCH
alias fetchconf='~/.config/sdgos/fastfetch/fetch-conf.sh'      # SDG-FETCH
alias pacgui=~/.config/sdgos/tuis/pkg-install.sh               # Shared/UTIL (non-existent yet)
alias aurgui=~/.config/sdgos/tuis/aur-install.sh               # Shared/UTIL (non-existent yet)
alias git-projects=~/.config/sdgos/tuis/project.select.sh      # SDG-UTIL-SCRIPTS (but path says "project.select" vs "project-select")
alias mangoconf=~/.config/sdgos/mango-config.sh                # SDG-MANGO-HELPERS
alias documentation=~/.config/sdgos/tuis/documentation.sh      # SDG-UTIL-SCRIPTS
alias tldrtui=~/.config/sdgos/help/cmd-help.sh                 # SDG-UTIL-SCRIPTS
alias helptui=~/.config/sdgos/help/help.sh                     # SDG-UTIL-SCRIPTS
```

### 3.3 Path discrepancy
- Line 36: `alias git-projects=~/.config/sdgos/tuis/project.select.sh` — note the dot vs dash.
- But `SDG-UTIL-SCRIPTS/local/SDG-UTILS/project-select.sh` uses a dash.
- Fix: `alias git-projects=~/.config/sdgos/tuis/project-select.sh`.

## 4. Deploy Path Map

| Source | Destination |
|--------|-------------|
| `config/ghostty/config.ghostty` | `~/.config/ghostty/config` (note: ghostty expects `config` not `config.ghostty`) |
| `config/ghostty/themes/dankcolors` | `~/.config/ghostty/themes/dankcolors` |
| `config/ghostty/themes/noctalia` | `~/.config/ghostty/themes/noctalia` |
| `other/zshrc` | `~/.zshrc` |
| `other/zshconfig.zsh` | `~/.config/sdgos/zshconfig.zsh` |
| `other/p10k.zsh` | `~/.p10k.zsh` |

### 4.1 Ghostty config name
- Ghostty expects its config at `~/.config/ghostty/config` (no extension), but the repo has it as `config.ghostty`.
- The install.sh should copy/rename: `cp config/ghostty/config.ghostty ~/.config/ghostty/config`.

## 5. Conflict Cleanup
- `config/ghostty/themes/dankcolors (conflicted copy 2026-05-19 150420)` — git merge conflict artifact, remove.

## 6. Modular Tips/Help Contribution

### 6.1 Tips
- Add tips about ghostty keybinds, zsh aliases, Powerlevel10k features.
- Currently the tips.list in SDG-TIPS already contains ghostty and zsh tips — ensure no duplication.

### 6.2 Help system
- The ghostty config reference and zsh customization could be help topics.
- Contribute to `~/.config/sdgos/help/topics/` via the install script.

## 7. Backward Compatibility
- Installing this module will overwrite `~/.zshrc` and `~/.p10k.zsh` — requires user confirmation and backup.
- The install script should:
  1. Check for existing files
  2. Ask for confirmation before overwriting
  3. Create `.bak` backups
  4. Preserve any user additions (e.g., keep the LM Studio PATH line but fix it)
