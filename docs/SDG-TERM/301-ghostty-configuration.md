# Ghostty Configuration

SDG-TERM provides a pre-configured Ghostty terminal emulator setup with dark themes and SDG-OS integration.

## Theme

Two dark themes are included in `~/.config/ghostty/themes/`:

| Theme | Background | Foreground | Style |
|-------|-----------|------------|-------|
| dankcolors | #0d141c | #dde3ee | Cool blue/pink/green |
| noctalia | #1c1e1e | #fffcf8 | Warm orange/green/blue |

The active theme is set in the config file. Default is `dankcolors`.

## Appearance

- **Opacity**: 50% (`background-opacity = 0.5`)
- **Window decorations**: None (`window-decoration = none`)
- **URL previews**: Enabled (`link-url = true`, `link-previews = true`)

## Startup

Every new Ghostty window runs:

```bash
/bin/zsh -c "sdgfetch && echo '' && sdgtip random && zsh"
```

This displays system info (SDG-FETCH), a random tip from SDG-TIPS, then drops into an interactive Zsh session.

## Keybindings

| Keybind | Action |
|---------|--------|
| Alt+Left | Split pane left |
| Alt+Right | Split pane right |
| Alt+Up | Split pane up |
| Alt+Down | Split pane down |
| Ctrl+R | Reload Ghostty config |

## Other Settings

- **Shell integration**: Zsh (`shell-integration = zsh`)
- **Scrollback**: Configurable limit (`scrollback-limit`)
- **Focus follows mouse**: Enabled
- **Working directory**: New tabs/splits inherit the current directory

## Config File

The configuration file is located at `~/.config/ghostty/config`. In this repository, the file is named `config.ghostty` to avoid editor conflicts.
