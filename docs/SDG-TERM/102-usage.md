# Terminal Usage

## Opening Windows

| Action | Result |
|--------|--------|
| `Super+Enter` | Open a new Ghostty window (from WM bind) |
| `Super+Tab` | Spawn another Ghostty window (from WM bind) |

New windows start in `$HOME` and auto-tile via the WM.

## Pane Splits

| Keybind | Action |
|---------|--------|
| `Alt+Up` | Split pane upward |
| `Alt+Down` | Split pane downward |
| `Alt+Left` | Split pane left |
| `Alt+Right` | Split pane right |

Splits inherit the working directory from the current pane.

## Windows vs Splits

Splits and new windows both produce tiled layouts, but they differ in working-directory behavior:

| Method | Working Directory | Best For |
|--------|------------------|----------|
| **Pane split** (`Alt+Arrow`) | Inherits from current pane | Quick side-by-side terminals in the same context |
| **New window** (`Super+Enter` / `Super+Tab`) | Starts in `$HOME` | Unrelated tasks, separate contexts |

- Use **pane splits** when you need another shell in the same directory as an active process.
- Use **new windows** (via WM bind) for separate tasks — they auto-tile alongside existing windows.

## Config Reload

After editing `~/.config/ghostty/config`, press `Ctrl+R` to reload the configuration without restarting the terminal.
