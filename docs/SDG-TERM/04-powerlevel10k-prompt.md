# Powerlevel10k Prompt

The prompt uses the **rainbow** theme with a single-line transient layout.

## Prompt Segments

### Left Side
- **OS icon** — distribution logo (configurable)
- **Directory** — current working directory
- **VCS** — git status (branch, dirty, ahead/behind)

### Right Side
Status, command execution time, background jobs, Python environments (virtualenv, anaconda, pyenv), Node.js (nvm, nodenv, nodeenv), Ruby (rbenv, rvm), Java (jenv), Go (goenv), Kubernetes context, cloud profiles (AWS, Azure, GCloud), NordVPN status, shell indicators, todo/task tracking, and more (50+ segments total).

## Transient Prompt

After a command is executed, the prompt is replaced with a simplified version, keeping the terminal clean.

## Instant Prompt

Powerlevel10k's instant prompt loads before the full Zsh configuration, making new shells start nearly instantly.

## Customization

To reconfigure the prompt:

```bash
p10k configure
```

Or edit `~/.p10k.zsh` directly.

### OS Icon

The default OS icon is Arch (``). To change it, set the `POWERLEVEL9K_LINUX_ICON` variable in `~/.zshconfig.zsh`:

```bash
export POWERLEVEL9K_LINUX_ICON=$'\uF313'  # NixOS
```

See the [Nerdfonts cheat sheet](https://www.nerdfonts.com/cheat-sheet) for available icons.
