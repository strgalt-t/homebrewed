#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Install Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Update Homebrew"
    brew update
fi

# Add Homebrew to PATH 
if [[ ":$PATH:" != *":/opt/homebrew/bin:"* ]]; then
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Install everything in the Brewfile
echo "Installing packages"
brew bundle

echo "Setup complete"