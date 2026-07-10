# SDG-TERM Analysis

## Type
Terminal Emulator + Shell Configuration Module

## Description
SDG-TERM provides Ghostty terminal emulator configuration, Zsh shell setup with Powerlevel10k prompt, and serves as a cross-package integration hub connecting SDG-FETCH, SDG-TIPS, SDG-UTILS, SDG-MANGO-CONF, and SDG-HELP.

## Usage
After installation via `sdgpkg install sdg-term` (or as a dependency of SDG-MANGO-CORE), the terminal and shell are configured.

### Ghostty Terminal
Launch Ghostty (from launcher or terminal). On startup, it automatically runs:
```bash
/bin/zsh -c "sdgfetch && echo "" && sdgtip random && zsh"
```
This displays system info (SDG-FETCH), a random tip (SDG-TIPS), then drops into an interactive Zsh session.

Keybindings within Ghostty:
| Keybind | Action |
|---------|--------|
| Alt+Left | Split left |
| Alt+Right | Split right |
| Alt+Up | Split up |
| Alt+Down | Split down |
| Ctrl+R | Reload Ghostty config |

### Shell Features
Once in Zsh, the following are available:
- **eza aliases**: `ls` (icons+colors), `la` (all files), `ll` (long format), `lt` (tree), `l.` (dotfiles)
- **zoxide**: `cd` is replaced with `zoxide` — type `cd <partial-name>` to jump to frequently used directories
- **fzf integration**: `find` — fuzzy file search with bat preview; `microfind` — open selected file in micro editor
- **Command history**: `cmdhist` — fzf search command history, select to type it via `wtype`
- **Sudo shortcut**: `plz` — re-run last command with sudo
- **Powerlevel10k prompt**: Rainbow style with git status, execution time, background jobs, cloud tools, etc.

### Cross-Package Aliases
| Alias | What it does | Source Package |
|-------|-------------|----------------|
| `tipme` | Show a random tip | SDG-TIPS |
| `alltips` | Browse all tips in fzf | SDG-TIPS |
| `cowtip` | Random tip with cowsay | SDG-TIPS |
| `tldrtui` | Browse command help | SDG-UTIL-SCRIPTS |
| `helptui` | Browse SDG-OS topics | SDG-UTIL-SCRIPTS |
| `documentation` | Open doc browser | SDG-UTIL-SCRIPTS |
| `git-projects` | Browse/open git projects | SDG-UTIL-SCRIPTS |
| `mangoconf` | Edit mangoWM config | SDG-MANGO-HELPERS |

## Directory Structure
```
SDG-TERM/
├── README.md                     # Minimal stub
├── install.sh                    # Partially implemented (has bugs)
├── uninstall.sh                  # Empty stub
├── update.sh                     # Empty stub
├── detect.sh                     # Empty stub
├── config/ghostty/
│   ├── config.ghostty            # Ghostty terminal config (30 lines)
│   ├── README.md                 # Ghostty config documentation
│   └── themes/
│       ├── dankcolors            # Dark theme (22 lines)
│       ├── noctalia              # Alternative dark theme (22 lines)
│       └── dankcolors (conflicted copy) # Git merge artifact
├── other/
│   ├── p10k.zsh                  # Powerlevel10k prompt (1837 lines)
│   ├── zshconfig.zsh             # Zsh aliases/tools (109 lines)
│   └── zshrc                     # Main Zsh config (106 lines)
├── cache/                        # Empty (runtime)
├── docs/                         # Empty (placeholder)
├── local/                        # Empty (placeholder)
├── tips/                         # Empty (placeholder)
└── README.md                     # Minimal stub
```

## Ghostty Configuration
- **Theme**: dankcolors (dark: #0d141c bg, #dde3ee fg)
- **Opacity**: 50%
- **Shell**: zsh
- **Startup command**: `/bin/zsh -c sdgfetch && echo "" && sdgtip random && zsh`
- **Scrollback**: ~1GB (1048576000 lines)
- **Features**: URL previews, no window decorations, mouse-follows-focus, shell integration
- **Keybinds**: Alt+Arrow for multi-pane splits, Ctrl+r for config reload

## Zsh Configuration
- **oh-my-zsh**: git, fzf, extract plugins
- **Syntax highlighting**: zsh-syntax-highlighting, zsh-autosuggestions, zsh-history-substring-search
- **Powerlevel10k**: Rainbow theme, 1-line transient prompt, 50+ status segments
- **Aliases**: eza-based (ls/la/ll/lt/l.), fzf integration (find/microfind), zoxide (cd replacement)
- **Tools**: `plz()` sudo function, `cmdhist` fzf history searcher, filetype associations (micro/satty)

## Cross-Package Aliases
| Alias | Target | Package |
|-------|--------|---------|
| `tipme`, `alltips`, `cowtip` | `~/.local/SDG-TIPS/sdg-tips` | SDG-TIPS |
| `git-projects` | `project-select.sh` | SDG-UTIL-SCRIPTS |
| `documentation` | `documentation.sh` | SDG-UTIL-SCRIPTS |
| `mangoconf` | `mango-config.sh` | SDG-MANGO-HELPERS |
| `tldrtui` | `cmd-help.sh` | SDG-UTIL-SCRIPTS |
| `helptui` | `help.sh` | SDG-UTIL-SCRIPTS |

## Ghostty Themes
| Theme | Background | Foreground | Style |
|-------|-----------|------------|-------|
| dankcolors | #0d141c | #dde3ee | Cool blue/pink/green |
| noctalia | #1c1e1e | #fffcf8 | Warm orange/green/blue |

## Required Dependencies
| Dependency | Purpose |
|------------|---------|
| ghostty | Terminal emulator |
| zsh | Shell |
| oh-my-zsh | Zsh framework |
| powerlevel10k | Prompt theme |
| eza | File listing (ls replacement) |
| zoxide | Directory jumper |
| fzf | Fuzzy finding |
| micro | Text editor |

## Optional Dependencies
None

## Required Dependents
- **SDG-MANGO-CORE**: Installs SDG-TERM as dependency

## Optional Dependents
- **SDG-DOCS**: Documents shell config

## Known Issues
- `install.sh` has `$RAND` typo (should be `$RANDOM`) in backup suffix
- Hardcoded `/home/$(whoami)/` paths instead of `$HOME`
- Ghostty config filename must be `config` not `config.ghostty` when deployed
- Three lifecycle stubs (uninstall/update/detect) are empty
- Git merge artifact (dankcolors conflicted copy) should be removed
