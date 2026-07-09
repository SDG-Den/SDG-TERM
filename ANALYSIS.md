# SDG-TERM Analysis

## Function

Provides Ghostty terminal emulator configuration, Zsh shell configuration (`.zshrc`, `.zshconfig.zsh`), and Powerlevel10k prompt theming (`p10k.zsh`). The package manages:

- **Ghostty config**: `config/ghostty/config.ghostty` — theme, opacity, keybinds, shell integration, startup command
- **Zsh config**: `other/zshrc` — oh-my-zsh, plugins, aliases, LM Studio PATH
- **Zsh aliases/tools**: `other/zshconfig.zsh` — eza, fzf, micro, zoxide, SDG-* tool aliases
- **P10k prompt**: `other/p10k.zsh` — rainbow theme (wizard-generated 2026-05-18)
- **Ghostty themes**: `config/ghostty/themes/` — `dankcolors`, `noctalia`
- **Lifecycle stubs**: `install.sh`, `uninstall.sh`, `update.sh`, `detect.sh`

---

## Dependencies (what SDG-TERM requires)

| Dependency | Required by | Evidence |
|---|---|---|
| ghostty | install.sh:4 | `unipkg install any ghostty` |
| zsh-history-substring-search | install.sh:5, other/zshrc:91 | `unipkg install any ...`, `source /usr/share/zsh/plugins/...` |
| zsh-syntax-highlighting | install.sh:6, other/zshrc:87 | same pattern |
| zsh-autosuggestions | install.sh:7, other/zshrc:88 | same pattern |
| zsh-doc | install.sh:8 | `unipkg install any zsh-doc` |
| zsh | install.sh:9, config.ghostty:5–7 | `unipkg install any zsh`, `command = /bin/zsh` |
| zsh-theme-powerlevel10k | install.sh:10, other/zshrc:84 | `unipkg install any ...`, `source /usr/share/zsh-theme-powerlevel10k/...` |
| zoxide | install.sh:11, other/zshconfig.zsh:108 | `eval "$(zoxide init zsh --cmd cd )"` |
| eza | install.sh:12, other/zshconfig.zsh:5–9 | `ls='eza -al ...'` and variants |
| oh-my-zsh | other/zshrc:11 | `export ZSH="/usr/share/oh-my-zsh"` |
| fzf | other/zshrc:22, other/zshconfig.zsh:109 | plugin, `source <(fzf --zsh)` |
| pkgfile | other/zshrc:94 | `source /usr/share/doc/pkgfile/command-not-found.zsh` |
| unipkg | install.sh structure | package manager assumed by dependency declarations |
| SDG-FETCH | config.ghostty:7, migration-plan.md:20–21 | `sdgfetch` command, deprecated `~/.config/sdgos/fastfetch/fetch.sh` |
| SDG-TIPS | config.ghostty:7, other/zshconfig.zsh:26–28 | `sdgtip` command, `~/.local/SDG-TIPS/sdg-tips random` |
| SDG-UTILS | other/zshconfig.zsh:32–35 | `project-select.sh`, `documentation.sh` |
| SDG-MANGO-CONF | other/zshconfig.zsh:33 | `mango-config.sh` |
| SDG-HELP | other/zshconfig.zsh:35–36 | `cmd-help.sh`, `help.sh` |
| LM Studio CLI | other/zshrc:100 | `export PATH="$PATH:/home/$(whoami)/.lmstudio/bin"` |

---

## Dependents (what depends on SDG-TERM)

| Dependent | Reference | File:Line |
|---|---|---|
| SDG-MANGO-CORE | `unipkg install any sdg-term` | `SDG-MANGO-CORE/install.sh:23` |
| SDGOS repo registry | Listed as package `sdg-term` | `SDG-REPO/SDGOS.repo:10`, `SDG-REPO-OLD/SDGOS.repo:10` |

---

## Use / Configuration

### Install mechanism

- `install.sh:15` — sets `WORKDIR=/home/$(whoami)/.cache/SDG-PKG/sdg-term`
- `install.sh:19–21` — backs up old Ghostty config, `.zshrc`, `.p10k.zsh` (uses unset `$RAND` variable — **bug**)
- `install.sh:24` — copies `config/*` to `~/.config`
- `install.sh:28–31` — copies `docs/` → `~/.local/docs`, `tips/` → `~/.local/tips`
- `install.sh:35–37` — copies `other/p10k.zsh` → `~/.p10k.zsh`, `other/zshrc` → `~/.zshrc`, `other/zshconfig.zsh` → `~/.zshconfig.zsh`

### Ghostty config cross-module refs (config/ghostty/config.ghostty)

| Reference | Line | Current | Migrated target |
|---|---|---|---|
| sdgfetch | 7 | `~/.config/sdgos/fastfetch/fetch.sh` | `~/.local/SDG-FETCH/fetch.sh` |
| sdgtip | 7 | `~/.config/sdgos/tips/tips.sh` | `~/.local/SDG-TIPS/tips.sh` |

### Zshconfig cross-module refs (other/zshconfig.zsh)

| Line | Current alias path | Migrated target |
|---|---|---|
| 26 | `~/.local/SDG-TIPS/sdg-tips random` | (already migrated) |
| 27 | `~/.local/SDG-TIPS/sdg-tips list` | (already migrated) |
| 28 | `~/.local/SDG-TIPS/sdg-tips random` via cowsay | (already migrated) |
| 32 | `~/.local/SDG-UTILS/project-select.sh` | (already migrated) |
| 33 | `~/.local/SDG-MANGO-CONF/mango-config.sh` | (already migrated) |
| 34 | `~/.local/SDG-UTILS/documentation.sh` | (already migrated) |
| 35 | `~/.local/SDG-HELP/cmd-help.sh` | (already migrated) |
| 36 | `~/.local/SDG-HELP/help.sh` | (already migrated) |

### Hardcoded paths (other/zshrc)

| Line | Content | Issue |
|---|---|---|
| 100 | `export PATH="$PATH:/home/$(whoami)/.lmstudio/bin"` | Should use `$HOME` |
| 106 | `source /home/$(whoami)/.zshconfig.zsh` | Should use `$HOME` |

---

## Deprecation / Outdated Items

### 1. Empty lifecycle stubs
- `uninstall.sh` — 0 lines (empty file)
- `update.sh` — 0 lines (empty file)
- `detect.sh` — 0 lines (empty file)
- `TESTCOMPLETE.md` — 0 lines (empty file)

### 2. Git merge artifact
- `config/ghostty/themes/dankcolors (conflicted copy 2026-05-19 150420)` — identical in structure to `dankcolors` with slightly different color values; leftover from unresolved merge conflict

### 3. Empty directories
- `docs/` — empty directory (no documentation files)
- `tips/` — empty directory (no tip files)
- `cache/` — empty directory (no cached data)

### 4. Unused variable in install.sh
- `install.sh:19` — `$RAND` is not set; backup suffix will be empty string (risks overwriting with no safety net). Should be `$RANDOM`.

### 5. Hardcoded `/home/$(whoami)/` instead of `$HOME`
- `install.sh:15` — `WORKDIR=/home/$(whoami)/.cache/SDG-PKG/sdg-term`
- `install.sh:24` — `/home/$(whoami)/.config`
- `install.sh:28–29` — `/home/$(whoami)/.local/docs`, `/home/$(whoami)/.local/tips`
- `install.sh:30–31` — `/home/$(whoami)/.local/docs/*`, `/home/$(whoami)/.local/tips/*`
- `install.sh:35–37` — `/home/$(whoami)/.p10k.zsh`, `/home/$(whoami)/.zshrc`, `/home/$(whoami)/.zshconfig.zsh`

### 6. Ghostty config filename
- `config/ghostty/config.ghostty` — Ghostty expects `~/.config/ghostty/config` (no `.ghostty` extension). Install script must rename on copy.

### 7. Deprecated old path migration
- Migration from old `~/.config/sdgos/` layout to new `~/.local/<MODULE>/` layout is documented in `migration-plan.md` but:
  - Paths in `config.ghostty` and `zshrc` still reference old scheme in comments/documentation
  - `other/zshconfig.zsh:25` — alias references `project.select.sh` (dot notation), migration-plan.md says fix to `project-select.sh` (dash notation)

### 8. README.md is a stub
- `README.md:1-2` — only contains `# SDG-TERM` heading, no body content

### 9. Cross-repo migration impact
- Migration of SDG-TERM paths is referenced in `SDG-UTIL-SCRIPTS/migration-plan.md` (lines 74–79) and `SDG-TIPS/migration-plan.md` (line 41), meaning changes have downstream coordination requirements.