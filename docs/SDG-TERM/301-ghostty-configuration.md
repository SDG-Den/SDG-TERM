# Ghostty Configuration

SDG-TERM provides a pre-configured Ghostty terminal emulator setup with dark themes and SDG-OS integration.

## Theme

The `dankcolors` theme is linked to the central SDG-OS theming engine and automatically adapts to the active OS theme (preset, flat-color, matugen-generated, etc.). The theme file lives at `~/.config/ghostty/themes/dankcolors`.

The active theme is set in the config file: `theme = dankcolors`.

## Appearance

- **Opacity**: 50% (`background-opacity = 0.5`)
- **Window decorations**: None (`window-decoration = none`)
- **URL previews**: Enabled (`link-url = true`, `link-previews = true`)

## Startup

Every new Ghostty window runs an `initial-command` that displays system info and a random tip before starting an interactive Zsh session:

```bash
/bin/zsh -c "command -v sdgfetch >/dev/null 2>&1 && sdgfetch || true; echo '' && command -v sdgtip >/dev/null && sdgtip random || true; zsh"
```

Each command is guarded with `command -v ... >/dev/null 2>&1 && ... || true`, so missing tools don't cause errors — the terminal always drops into Zsh cleanly.

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
- **Working directory**: See [102-usage](102-usage.md) for split vs new-window behavior

## Config File

The configuration file is located at `~/.config/ghostty/config`. In this repository, the file is named `config.ghostty` to avoid editor conflicts.

After editing, press `Ctrl+R` to reload the configuration without restarting.
