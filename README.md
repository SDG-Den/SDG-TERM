# SDG-TERM

Terminal environment configuration — Ghostty terminal, Zsh shell, Powerlevel10k prompt, and SDG-OS toolchain integration.

## Description

SDG-TERM configures the complete terminal experience for SDG-OS. It sets up Ghostty with dark themes and 50% opacity, Zsh with oh-my-zsh + Powerlevel10k, and bridges all SDG-OS tools into the shell with convenient aliases.

## Features

- **Ghostty terminal** — auto-adapting dark theme, 50% opacity, pane splits (Alt+Arrow), config hot-reload (Ctrl+R)
- **Startup display** — runs `sdgfetch` + `sdgtip random` on every new terminal
- **Zsh config** — oh-my-zsh (git/fzf/extract), syntax highlighting, autosuggestions, history search
- **Powerlevel10k** — rainbow theme, transient prompt, 50+ status segments
- **eza aliases** — `ls`, `la`, `ll`, `lt`, `l.` with icons and colors
- **zoxide** — smart directory jumping (`cd <partial>`)
- **fzf integration** — `find` fuzzy file search, `cmdhist` history searcher
- **SDG-OS integration** — `tipme`, `alltips`, `cowtip` (SDG-TIPS); `git-projects`, `documentation` (SDG-UTILS); `mangoconf` (SDG-MANGO-HELPERS); `tldrtui` (SDG-HELP); `cmdhist`, `plz` (built-in)
- **Sudo shortcut** — `plz` re-runs last command with sudo

## Installation

```bash
sdgpkg install sdg-term
```

Note: SDG-TERM is also installed automatically as a dependency of SDG-MANGO-CORE.

## Dependencies

- `ghostty` — terminal emulator
- `zsh` — shell
- `oh-my-zsh` — Zsh framework
- `powerlevel10k` — prompt theme
- `eza` — modern ls replacement
- `zoxide` — smart directory jumper
- `fzf` — fuzzy finding
- `micro` — text editor

## Related Packages

- **SDG-FETCH** — displayed on terminal startup
- **SDG-TIPS** — random tip on startup, aliases (tipme/alltips/cowtip)
- **SDG-UTIL-SCRIPTS** — commands (tldrtui, documentation, git-projects)
- **SDG-MANGO-HELPERS** — alias (mangoconf)
