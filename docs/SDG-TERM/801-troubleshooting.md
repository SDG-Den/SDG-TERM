# Troubleshooting

## Ghostty Config Not Applying

After editing `~/.config/ghostty/config`, press `Ctrl+R` in any Ghostty window to hot-reload. If that doesn't work, close all Ghostty windows and reopen.

## Zsh Config Errors

Check syntax:

```bash
zsh -n ~/.zshrc
zsh -n ~/.zshconfig.zsh
```

If there are errors, check the file at the reported line.

## Theme Not Updating

The `dankcolors` theme is managed by the SDG-OS theming engine. If the terminal colors don't match the active theme, ensure the theming engine is running:

```bash
sdg-theme status
```

## Missing Commands

Commands like `tldrtui`, `git-projects`, `mangoconf`, and `documentation` are provided by other SDG-OS packages. Run `sdgpkg list` to check which are installed.

## Shell Integration Not Working

Ghostty's shell integration enables features like working-directory tracking and split inheritance. Ensure `shell-integration = zsh` is set in the config and that Zsh is the default shell (`SHELL=/bin/zsh`).
