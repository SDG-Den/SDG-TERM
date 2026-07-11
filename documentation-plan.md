# SDG-TERM Documentation Plan

## Current Status
Docs directory is empty (only `.placeholder`). Tips directory is empty (only `.placeholder`).
One config README exists (`config/ghostty/README.md`, 22 lines).

## Source-Verified Inventory
**Components:**
- Ghostty terminal config: dankcolors/noctalia themes, 50% opacity, 1GB scrollback, Alt+Arrow pane splits, Ctrl+R hot-reload
- Startup display: runs `sdgfetch && echo && sdgtip random` on every new terminal
- Zsh config (oh-my-zsh): plugins (git/fzf/extract), syntax highlighting, autosuggestions, history search, pkgfile command-not-found
- Powerlevel10k rainbow prompt: OS icon, dir, git status (left), 50+ segments (right), transient prompt, instant prompt
- eza aliases: ls, la, ll, lt, l.
- zoxide: smart cd replacement
- fzf integration: file search, cmdhist (command history searcher)
- SDG-OS integration aliases: tipme, alltips, cowtip (→SDG-TIPS), tldrtui (→SDG-HELP), helptui (→SDG-HELP), documentation (→SDG-UTILS), git-projects (→SDG-UTILS), mangoconf (→SDG-MANGO-CONF)
- plz() sudo shortcut function
- Filetype associations in zshconfig.zsh

### Known Issues (document in troubleshooting)
- Hardcoded `/home/$(whoami)/` paths instead of `$HOME` in zshconfig.zsh
- Ghostty config file named `config.ghostty` but must be `config` when deployed
- No detect.sh script exists

## Docs System (`docs/`)
**Deploy location**: `~/.local/docs/SDG-TERM/`

### Planned Doc Topics
| # | Topic | Description | Priority |
|---|-------|-------------|----------|
| 1 | Terminal Setup | What SDG-TERM configures: Ghostty + Zsh + P10k, installation | High |
| 2 | Ghostty Configuration | Themes, opacity, keybinds, startup command, shell integration | High |
| 3 | Zsh Configuration | oh-my-zsh plugins, aliases (eza, zoxide, fzf), custom functions | High |
| 4 | Powerlevel10k Prompt | Segments, transient prompt, customization options | Medium |
| 5 | Shell Aliases and SDG-OS Integration | All aliases to other packages: tipme, tldrtui, helptui, documentation, git-projects, mangoconf, plz, cmdhist | High |
| 6 | Troubleshooting | Common issues: hardcoded home paths, ghostty config filename, detect.sh missing | Medium |

### Existing Content
| File | Notes |
|------|-------|
| `config/ghostty/README.md` | 22 lines — brief Ghostty features overview. Absorb into topic #2 |
| `README.md` (root) | 45 lines — feature summary. Source material |
| `analysis.md` | Known issues documentation — source for topic #6 |

## Tips System (`tips/`)
**Deploy location**: `~/.local/tips/SDG-TERM/`

### Planned Tips
| # | Tip | Priority |
|---|-----|----------|
| 1 | Terminal shows sdgfetch + sdgtip on every new window | High |
| 2 | Quick tip with `tipme` from any terminal | High |
| 3 | eza aliases: ls, la, ll, lt for colorful listings | High |
| 4 | zoxide: cd <partial> jumps to any directory | High |
| 5 | fzf file search with `find` and bat preview | Medium |
| 6 | plz re-runs last command with sudo | Medium |
| 7 | Ghostty splits with Alt+Arrow | Medium |
| 8 | cmdhist searches command history with fzf | Low |
| 9 | Ctrl+R reloads Ghostty config | Low |

## Implementation Notes
- Topic #5 was "Cross-Package Integration" — renamed to "Shell Aliases and SDG-OS Integration" to accurately describe the actual aliases
- All docs go in `nn-topic-name.md` format under `docs/SDG-TERM/`
- Tips in `tips/SDG-TERM/tips.list`
- The `config/ghostty/README.md` should be expanded and folded into topic #2
- Source for aliases: `other/zshconfig.zsh` and `other/zshrc`
