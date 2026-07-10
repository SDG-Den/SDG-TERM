# SDG-TERM Documentation Plan

## Current Status
One doc file exists (`config/ghostty/README.md`, Ghostty config documentation). No docs/ or tips/ directories are populated.

## Docs System (`docs/`)
**Deploy location**: `~/.local/docs/SDG-TERM/`

### Existing Docs
| File | Topic |
|------|-------|
| config/ghostty/README.md | Ghostty config: features, keybinds, DMS theme integration, notes |

### Planned Doc Topics
| # | Topic | Description | Priority |
|---|-------|-------------|----------|
| 1 | Terminal Setup | What SDG-TERM configures: Ghostty, Zsh, Powerlevel10k | High |
| 2 | Ghostty Configuration | Theme (dankcolors), opacity, keybinds, shell integration, startup command | High |
| 3 | Zsh Configuration | oh-my-zsh plugins, aliases (eza, fzf, zoxide), custom functions | High |
| 4 | Powerlevel10k Prompt | Prompt segments, transient prompt, customization | Medium |
| 5 | Cross-Package Integration | How SDG-FETCH, SDG-TIPS, SDG-UTILS, SDG-MANGO-HELPERS aliases work | High |
| 6 | Troubleshooting | Common issues: shell not starting, prompt broken, missing fonts | Medium |

### Implementation
- Create `docs/SDG-TERM/` directory with numbered markdown files
- Follow SDG-DOCS naming convention
- Register in `install.sh` for deployment to `~/.local/docs/`

## Tips System (`tips/`)
**Deploy location**: `~/.local/tips/SDG-TERM/`

### Planned Tips
| # | Tip | Description | Priority |
|---|-----|-------------|----------|
| 1 | Terminal startup | Terminal shows sdgfetch + sdgtip on open | High |
| 2 | Quick tip | Type `tipme` for a random tip | High |
| 3 | Eza aliases | `ls`, `la`, `ll`, `lt` — enhanced file listing with icons | High |
| 4 | Zoxide navigation | `cd <partial>` — jump to frequently-used directories | High |
| 5 | Fuzzy find | `find` — fuzzy file search with bat preview | Medium |
| 6 | Sudo shortcut | `plz` — re-run last command with sudo | Medium |
| 7 | Ghostty splits | Alt+Arrow — create and navigate split panes | Medium |
| 8 | History search | `cmdhist` — search command history with fzf | Low |
| 9 | Reload config | Ctrl+R in Ghostty — reload terminal config | Low |

### Implementation
- Create `tips/SDG-TERM/tips.list` with the above tips
- Register in `install.sh` for deployment to `~/.local/tips/`
