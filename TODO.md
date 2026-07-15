# TODO — SDG-TERM

## Documentation
- [x] Verify aliases documented correctly (current state, not aspirational)
- [x] Mark Arch-specific aliases as conditional in docs

## Changes
- [x] Remove `helptui` alias
- [x] Make `update` alias conditional (Arch-only)
- [x] Make `gitpkg` alias conditional (Arch-only)
- [x] Make `apt` / `apt-get` aliases conditional (Arch-only)
- [x] Migrate Arch-specific content to `other/.distros.zsh` with OS_LIKE case statement
- [x] Source `.distros.zsh` from `~/.zshconfig.zsh`
- [ ] Convert `git-projects` alias to /usr/bin/ symlink *(handled by SDG-UTILS)*
- [ ] Convert `mangoconf` alias to /usr/bin/ symlink *(handled by SDG-MANGO-CONF)*
- [ ] Convert `documentation` alias to /usr/bin/ symlink *(handled by SDG-UTILS)*
- [ ] Convert `tldrtui` alias to /usr/bin/ symlink *(handled by SDG-HELP)*

## Testing
- [ ] All aliases resolve after install
- [ ] Ghostty config applies without errors
- [ ] Zsh config loads without errors
- [ ] Powerlevel10k prompt renders correctly
