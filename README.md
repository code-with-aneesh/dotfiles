# Dotfiles

This repo uses GNU Stow to manage Hyprland config.

## Layout

- `hypr/.config/hypr/` maps to `~/.config/hypr/`
- `kitty/.config/kitty/` maps to `~/.config/kitty/`
- `waybar/.config/waybar/` maps to `~/.config/waybar/`
- `rofi/.config/rofi/` maps to `~/.config/rofi/`
- `zsh/.zshrc` maps to `~/.zshrc`
- `zsh/.p10k.zsh` maps to `~/.p10k.zsh`

## Deploy

From this repo:

```bash
stow -d ~/Dotfiles -t ~ hypr
stow -d ~/Dotfiles -t ~ kitty
stow -d ~/Dotfiles -t ~ waybar
stow -d ~/Dotfiles -t ~ rofi
stow -d ~/Dotfiles -t ~ zsh
```

If you want to restow after changes:

```bash
stow -d ~/Dotfiles -t ~ -R hypr
```
