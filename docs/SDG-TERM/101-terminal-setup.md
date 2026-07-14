# Terminal Setup

SDG-TERM configures the complete terminal environment for SDG-OS:

- **Ghostty** terminal emulator with dark themes
- **Zsh** shell with oh-my-zsh framework
- **Powerlevel10k** rainbow prompt

## Installation

```bash
sdgpkg install sdg-term
```

SDG-TERM is also installed automatically as a dependency of SDG-MANGO-CORE.

## Dependencies

| Package | Purpose |
|---------|---------|
| ghostty | Terminal emulator |
| zsh | Shell |
| oh-my-zsh | Zsh framework |
| powerlevel10k | Prompt theme |
| eza | Modern ls replacement |
| zoxide | Smart directory jumper |
| fzf | Fuzzy finding |
| micro | Text editor |

## Related Packages

- **SDG-FETCH** — displayed on terminal startup
- **SDG-TIPS** — random tips on startup, aliases (tipme/alltips/cowtip)
- **SDG-UTIL-SCRIPTS** — aliases (tldrtui, helptui, documentation, git-projects)
- **SDG-MANGO-HELPERS** — alias (mangoconf)
