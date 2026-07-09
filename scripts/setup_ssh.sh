#!/usr/bin/env bash

# This script generates an ed25519 SSH key for GitHub and starts the ssh-agent.

echo "Setting up SSH for GitHub..."

read -p "Enter the email associated with your GitHub account: " github_email

ssh_key_path="$HOME/.ssh/id_ed25519_github"

# Ensure SSH directory exists with correct permissions
mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"

if [ -f "$ssh_key_path" ]; then
    echo "An SSH key already exists at $ssh_key_path. Skipping generation."
else
    echo "Generating a new ed25519 SSH key for GitHub..."
    ssh-keygen -t ed25519 -C "$github_email" -f "$ssh_key_path" -N ""
    echo "Key generated successfully."
fi

# Configure SSH Host settings for github.com
ssh_config_file="$HOME/.ssh/config"
if [ ! -f "$ssh_config_file" ] || ! grep -q "Host github.com" "$ssh_config_file"; then
    echo "Configuring SSH host profile in $ssh_config_file..."
    cat <<EOF >> "$ssh_config_file"

Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519_github
    IdentitiesOnly yes
EOF
    chmod 600 "$ssh_config_file"
else
    echo "SSH config for github.com already exists in $ssh_config_file."
fi

echo "Starting ssh-agent..."
eval "$(ssh-agent -s)"
ssh-add "$ssh_key_path"

echo ""
echo "====================================================================="
echo "Your public SSH key is:"
echo ""
cat "${ssh_key_path}.pub"
echo ""
echo "====================================================================="
echo "Next Steps:"
echo "1. Copy the key above."
echo "2. Go to GitHub -> Settings -> SSH and GPG keys -> New SSH key."
echo "3. Paste the key and save."
echo "4. Test the connection by running: ssh -T git@github.com"
