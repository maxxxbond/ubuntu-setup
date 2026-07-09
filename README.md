# Dotfiles

This repository contains my personal configuration files (dotfiles) for EndeavourOS (GNOME, Zsh).

## Structure

The repository is split into two main directories, which perfectly matches how `GNU Stow` manages symlinks:
- `home/` — Contains files that belong directly in the home directory `~/` (e.g., `.zshrc`, `.gitconfig`).
- `config/` — Contains configurations that belong in `~/.config/` (e.g., `fastfetch`, `alacritty`, etc.).
- `scripts/` — Provisioning scripts for system setup, installing packages, configuring Git and SSH.

## Installation

This setup uses `GNU Stow` to manage symlinks. It's the de-facto standard for dotfiles because it automatically mirrors the directory structure without needing complex scripts.

1. Ensure `stow` is installed:
   ```bash
   sudo pacman -S stow
   ```

2. Clone the repository:
   ```bash
   git clone https://github.com/YourUsername/dotfiles.git ~/Projects/dotfiles
   cd ~/Projects/dotfiles
   ```

3. Run the installation script to automatically create symlinks:
   ```bash
   ./install.sh
   ```

   Alternatively, you can do it manually:
   ```bash
   # Symlink everything from home/ directly into ~/
   stow home -t ~/
   
   # Symlink everything from config/ into ~/.config/
   stow config -t ~/.config/
   ```

## Adding New Configs
1. Move the file or folder into the repository (e.g., `mv ~/.config/fastfetch ~/Projects/dotfiles/config/`).
2. Run `./install.sh` again to let stow create the new symlinks.

## Scripts
Check out the `scripts/` folder to quickly provision a new system:
- `setup_git.sh`: Configures your local `.gitconfig.local` for safe commits.
- `setup_ssh.sh`: Generates an SSH key for GitHub.
- `install_packages.sh`: Installs base apps like Discord, Telegram, and VSCodium.
- `update_system.sh`: Quick alias for updating Pacman and AUR packages.
