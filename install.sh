#!/usr/bin/env bash

# This script automatically symlinks your dotfiles into the correct locations.
# It links individual files/folders so that conflicts in one file won't block the rest.

echo "Installing dotfiles..."

# Get the absolute path of the dotfiles directory
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# Define ANSI colors for terminal output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

conflict_detected=0
failed_files=()

# Helper function to link a single item
link_item() {
    local source_path="$1"
    local target_path="$2"
    local relative_name="$3"
    
    # Check if target is already a symlink pointing to the correct source
    if [ -L "$target_path" ]; then
        if [ "$(readlink -f "$target_path")" = "$(readlink -f "$source_path")" ]; then
            echo -e "${CYAN}[ EXISTS   ]${NC} $relative_name is already correctly linked."
            return 0
        fi
    fi
    
    # Check for conflict
    if [ -e "$target_path" ] || [ -L "$target_path" ]; then
        echo -e "${RED}[ CONFLICT ]${NC} $target_path already exists (blocking $relative_name)."
        conflict_detected=1
        failed_files+=("$relative_name")
        return 1
    fi
    
    # Ensure parent directory exists
    mkdir -p "$(dirname "$target_path")"
    
    # Create the symlink
    ln -s "$source_path" "$target_path"
    echo -e "${GREEN}[ LINKED   ]${NC} $relative_name linked to $target_path"
}

echo -e "${BLUE}=====================================${NC}"
echo -e "${BLUE}   Starting Dotfiles Installation   ${NC}"
echo -e "${BLUE}=====================================${NC}"
echo ""

# 1. Link home configurations (to ~/)
if [ -d "$DOTFILES_DIR/home" ]; then
    echo -e "${BLUE}--> Processing home configurations:${NC}"
    while read -r item; do
        [ -z "$item" ] && continue
        name=$(basename "$item")
        [ "$name" = ".keep" ] && continue
        link_item "$item" "$HOME/$name" "home/$name"
    done < <(find "$DOTFILES_DIR/home" -mindepth 1 -maxdepth 1)
    echo ""
fi

# 2. Link config configurations (to ~/.config/)
if [ -d "$DOTFILES_DIR/config" ]; then
    echo -e "${BLUE}--> Processing config configurations:${NC}"
    while read -r item; do
        [ -z "$item" ] && continue
        name=$(basename "$item")
        [ "$name" = ".keep" ] && continue
        link_item "$item" "$HOME/.config/$name" "config/$name"
    done < <(find "$DOTFILES_DIR/config" -mindepth 1 -maxdepth 1)
    echo ""
fi

# Print summary
echo ""
if [ $conflict_detected -eq 1 ]; then
    echo -e "${YELLOW}=====================================================================${NC}"
    echo -e "${YELLOW}WARNING: Some files could not be linked due to conflicts!${NC}"
    echo -e "Failed item(s):"
    for file in "${failed_files[@]}"; do
        echo -e "  - $file"
    done
    echo -e ""
    echo -e "To resolve this, please back up or delete the existing files"
    echo -e "listed above, and run this script again."
    echo -e "${YELLOW}=====================================================================${NC}"
    exit 1
else
    echo -e "${GREEN}SUCCESS: All files have been successfully linked!${NC}"
fi
