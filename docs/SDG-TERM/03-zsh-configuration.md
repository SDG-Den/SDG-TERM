# Zsh Configuration

SDG-TERM configures Zsh with oh-my-zsh and several enhancements.

## oh-my-zsh Plugins

The following plugins are enabled:

- **git** — git aliases and prompt integration
- **fzf** — fuzzy finding integration
- **extract** — extract any archive with a single command (`x`)

## Shell Enhancements

- **Syntax highlighting** — commands are highlighted as you type
- **Autosuggestions** — suggests commands based on history
- **History substring search** — type part of a command and press Up/Down to search
- **Command-not-found handler** — suggests packages for unknown commands (via pkgfile)

## Aliases

### File Listing (eza)

| Alias | Command | Description |
|-------|---------|-------------|
| `ls` | `eza -al --icons` | Detailed listing with icons |
| `la` | `eza -a --icons` | All files and dirs |
| `ll` | `eza -l --icons` | Long format |
| `lt` | `eza -aT --level=4 --icons` | Tree view (4 levels) |
| `l.` | `eza -a \| grep '^\.'` | Dotfiles only |

### Navigation

| Alias | Description |
|-------|-------------|
| `..` | Go up one directory |
| `...` | Go up two directories |
| `....` | Go up three directories |
| `.....` | Go up four directories |
| `......` | Go up five directories |

### Fuzzy Finding (fzf)

| Command | Description |
|---------|-------------|
| `find` | Fuzzy file search with bat preview |
| `microfind` | Fuzzy file search, opens selection in micro |

### Directory Jumper (zoxide)

`cd` is replaced by zoxide. Type `cd <partial-name>` to jump to a frequently used directory, even with a partial match.

### Other Aliases

| Alias | Description |
|-------|-------------|
| `cmdhist` | Search command history with fzf, paste selection |
| `c` | Clear screen |
| `make` | `make -j$(nproc)` — parallel builds |
| `ninja` / `n` | `ninja -j$(nproc)` — parallel builds |
| `update` | `sudo pacman -Syu` |
| `rmpkg` | `sudo pacman -Rsn` — remove package |
| `cleanch` | `sudo pacman -Scc` — clean cache |
| `fixpacman` | Remove pacman lock file |
| `please` | `sudo` |
| `tb` | Paste to termbin.com |
| `cleanup` | Remove orphaned packages |
| `rip` | List recently installed packages |
| `jctl` | `journalctl -p 3 -xb` — error messages |
| `apt` / `apt-get` | `man pacman` — help for Arch newcomers |
| `gitpkg` | Count installed -git packages |
| `dir` / `vdir` | Colorized directory listing |
| `grep` / `fgrep` / `egrep` | Colorized grep |

### Filetype Associations

Files opened without a program (e.g. `./config.toml`) use the EDITOR or IMAGEPROGRAM based on extension:

| Extension | Program |
|-----------|---------|
| .json, .yaml, .md, .toml, .conf, .yml, .txt, .css, .html, .nix | micro |
| .png, .jpg, .jpeg, .webp | satty |

### plz() — Sudo Shortcut

```bash
plz                    # re-runs the last command with sudo
plz <command>          # runs the given command with sudo
```

If called without arguments, `plz` re-runs the previous command with `sudo`. With arguments, it acts as a normal sudo prefix.
