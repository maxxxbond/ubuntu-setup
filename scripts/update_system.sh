#!/usr/bin/env bash

# This script performs a full system update, including AUR packages if a helper is installed.

echo "Updating the system..."

if command -v yay &> /dev/null; then
    echo "Using yay to update system and AUR packages..."
    yay -Syu --noconfirm
elif command -v paru &> /dev/null; then
    echo "Using paru to update system and AUR packages..."
    paru -Syu --noconfirm
else
    echo "No AUR helper found. Updating official repositories only..."
    sudo pacman -Syu --noconfirm
fi

echo "System update complete!"
