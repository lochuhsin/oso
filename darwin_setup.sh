#!/bin/bash

# Detect the operating system
if [[ "$(uname)" == "Darwin" ]]; then
  echo "macOS detected. Running installation..."
  
  # Check if Homebrew is installed
  if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Check if Homebrew installation was successful
    if [ $? -ne 0 ]; then
      echo "Error: Homebrew installation failed. Please try again manually."
      exit 1
    fi

  echo "Installing RustUp with Homebrew..."
  brew install rustup
  
  if [ $? -ne 0 ]; then
    echo "Error: Rust installation with Homebrew failed."
    exit 1
  fi


  else
    echo "Homebrew is already installed."
  fi
  
  # Run the installation commands
  brew install qemu && \
  rustup update && \
  rustup install nightly && \
  cargo install bootimage
  
  if [ $? -eq 0 ]; then
    echo "Installation completed successfully."
  else
    echo "An error occurred during installation."
  fi
else
  echo "Operating system is not macOS. Skipping installation."
fi