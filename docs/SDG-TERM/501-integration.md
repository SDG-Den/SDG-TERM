# Shell Aliases and SDG-OS Integration

SDG-TERM bridges SDG-OS tools into the shell. The following tools are provided as `/usr/bin/` symlinks by their respective packages:

| Tool | Package |
|------|---------|
| `git-projects` | SDG-UTILS |
| `documentation` | SDG-UTILS |
| `mangoconf` | SDG-MANGO-HELPERS |
| `tldrtui` | SDG-HELP |

The old `helptui` command has been removed.

## SDG-TIPS Integration

| Alias | Command | Description |
|-------|---------|-------------|
| `tipme` | `~/.local/SDG-TIPS/sdg-tips random` | Show a random tip |
| `alltips` | `~/.local/SDG-TIPS/sdg-tips list` | Browse all tips via fzf |
| `cowtip` | `cowsay -r $(sdg-tips random) \| lolcat` | Random tip with cowsay + lolcat |

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
