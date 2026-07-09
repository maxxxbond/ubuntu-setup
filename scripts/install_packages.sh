#!/usr/bin/env bash

# This script installs core packages (Telegram, Discord, Signal, Code).
# It will use an AUR helper (yay or paru) if available, otherwise fallback to pacman.

echo "Installing core applications..."

# Determine the package manager
if command -v yay &> /dev/null; then
    PKG_MGR="yay -S --needed --noconfirm"
    echo "Found yay, using it for installations."
elif command -v paru &> /dev/null; then
    PKG_MGR="paru -S --needed --noconfirm"
    echo "Found paru, using it for installations."
else
    PKG_MGR="sudo pacman -S --needed --noconfirm"
    echo "No AUR helper found. Using pacman. (Note: some packages like VSCodium might require an AUR helper)"
fi

# Define the packages to install
# Note: 'code' is the open source build of VS Code (Code - OSS) available in the official repos.
# If you prefer the VSCodium bin, you could use 'vscodium-bin' with an AUR helper.
PACKAGES=(
    "telegram-desktop"
    "discord"
    "signal-desktop"
    "code"
    "zoxide"
)

echo "Executing: $PKG_MGR ${PACKAGES[*]}"
$PKG_MGR "${PACKAGES[@]}"

echo "Installation complete!"
