#!/usr/bin/env bash

# This script configures your local Git identity without exposing it in the public repository.

echo "Setting up local Git configuration..."

read -p "Enter your Git Name (e.g., John Doe): " git_name
read -p "Enter your Git Email (e.g., john@example.com): " git_email

cat <<EOF > ~/.gitconfig.local
[user]
    name = $git_name
    email = $git_email
EOF

echo "Successfully created ~/.gitconfig.local!"
echo "Your identity is now configured locally and won't be committed to the public dotfiles repo."
