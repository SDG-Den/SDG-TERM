# Shell Aliases and SDG-OS Integration

SDG-TERM bridges all SDG-OS tools into the shell with convenient aliases.

## SDG-TIPS Integration

| Alias | Command | Description |
|-------|---------|-------------|
| `tipme` | `~/.local/SDG-TIPS/sdg-tips random` | Show a random tip |
| `alltips` | `~/.local/SDG-TIPS/sdg-tips list` | Browse all tips via fzf |
| `cowtip` | `cowsay -r $(sdg-tips random) \| lolcat` | Random tip with cowsay + lolcat |

## SDG-HELP Integration

| Alias | Command | Description |
|-------|---------|-------------|
| `tldrtui` | `~/.local/SDG-HELP/cmd-help.sh` | Browse command help |
| `helptui` | `~/.local/SDG-HELP/help.sh` | Browse SDG-OS topics |

## SDG-UTILS Integration

| Alias | Command | Description |
|-------|---------|-------------|
| `documentation` | `~/.local/SDG-UTILS/documentation.sh` | Open doc browser |
| `git-projects` | `~/.local/SDG-UTILS/project-select.sh` | Browse/open git projects |

## SDG-MANGO-HELPERS Integration

| Alias | Command | Description |
|-------|---------|-------------|
| `mangoconf` | `~/.local/SDG-MANGO-CONF/mango-config.sh` | Edit mangoWM config |

## Built-in Tools

| Command | Description |
|---------|-------------|
| `plz` | Re-runs last command with sudo (or runs a given command with sudo) |
| `cmdhist` | Search command history with fzf and paste the selection |

## Environment Variables

| Variable | Value | Purpose |
|----------|-------|---------|
| `EDITOR` | micro | Default text editor |
| `SHELL` | /bin/zsh | Default shell |
