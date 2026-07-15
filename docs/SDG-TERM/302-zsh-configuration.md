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
| `please` | `sudo` |
| `tb` | Paste to termbin.com |
| `jctl` | `journalctl -p 3 -xb` — error messages |
| `dir` / `vdir` | Colorized directory listing |
| `grep` / `fgrep` / `egrep` | Colorized grep |

### Distro-Specific Aliases

Distro-specific package-management aliases are defined in `~/.distros.zsh`, sourced automatically from `~/.zshconfig.zsh`. They are set based on the `ID_LIKE` value in `/etc/os-release`:

| Alias | Arch (`ID_LIKE=arch`) | Debian/Ubuntu | Fedora/RHEL |
|-------|----------------------|---------------|-------------|
| `update` | `sudo pacman -Syu` | `sudo apt update && sudo apt upgrade` | `sudo dnf update` |
| `rmpkg` | `sudo pacman -Rsn` | `sudo apt remove` | `sudo dnf remove` |
| `cleanch` | `sudo pacman -Scc` | `sudo apt autoremove && sudo apt autoclean` | `sudo dnf clean all` |
| `gitpkg` | Count installed AUR -git packages | Count installed -git packages | Count installed -git packages |
| `fixpacman` | Remove pacman lock file | — | — |
| `cleanup` | Remove orphaned packages | — | — |
| `rip` | List recently installed packages (expac) | — | — |
| `apt` / `apt-get` | `man pacman` (help for newcomers) | `sudo apt` | — |

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
