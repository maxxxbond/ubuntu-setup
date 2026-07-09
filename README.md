# Dotfiles

This repository contains my personal configuration files (dotfiles) for EndeavourOS (GNOME, Zsh).

## Structure

The repository is split into logical directories for clean management:
- `home/` — Contains files that belong directly in the home directory `~/` (e.g., `.zshrc`, `.gitconfig`).
- `config/` — Contains configurations that belong in `~/.config/` (e.g., `fastfetch`).
- `firefox/` — Contains custom Firefox user configurations and UI styling. See the [Firefox Documentation](firefox/README.md) for extension recommendations.
- `scripts/` — Provisioning scripts for system setup, installing packages, configuring Git and SSH.

## Installation

This setup uses a custom installation script that creates symlinks dynamically and safely detects file conflicts. It requires no external dependencies.

1. Clone the repository:
   ```bash
   git clone https://github.com/maxxxbond/dotfiles.git ~/Projects/dotfiles
   cd ~/Projects/dotfiles
   ```

2. Run the installation script:
   ```bash
   ./install.sh
   ```
   This script will automatically:
   - Symlink files from `home/` to `~/`
   - Symlink folders from `config/` to `~/.config/`
   - Detect your active Firefox profile and apply the custom `user.js` and `chrome` modifications.

## Adding New Configs
1. Move the file or folder into the repository (e.g., `mv ~/.config/alacritty ~/Projects/dotfiles/config/`).
2. Run `./install.sh` again to create the new symlinks.

## Scripts
Check out the `scripts/` folder to quickly provision a new system:
- `setup_git.sh`: Configures your local `.gitconfig.local` for safe commits.
- `setup_ssh.sh`: Generates an SSH key for GitHub.
- `install_packages.sh`: Installs base apps like Discord, Telegram, VSCodium, and terminal tools.
- `update_system.sh`: Quick alias for updating Pacman and AUR packages.
