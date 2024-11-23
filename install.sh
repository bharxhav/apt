#!/bin/bash

# =============================================================================
# APT Automation Script
# 
# This script adds GPG keys and repository URLs for selected applications.
# It does not install any packages. Use it to simplify the setup of your
# system's package sources.
# 
# Usage:
#   bash <(curl -s https://apt.bharxhav.com/install.sh) [OPTIONS]
# 
# Options:
#   --qbittorrent    Add qBittorrent repository and GPG key
#   --obsidian       Add Obsidian repository and GPG key
#   --vscode         Add Visual Studio Code repository and GPG key
#   --all            Add all supported repositories and GPG keys
#   -h, --help       Display this help message
# =============================================================================

set -e

# =============================================================================
# Function: show_help
# Description: Displays the help message
# =============================================================================
show_help() {
    echo "APT Automation Script"
    echo
    echo "This script adds GPG keys and repository URLs for selected applications."
    echo "It does not install any packages."
    echo
    echo "Usage:"
    echo "  bash <(curl -s https://apt.bharxhav.com/install.sh) [OPTIONS]"
    echo
    echo "Options:"
    echo "  --qbittorrent    Add qBittorrent repository and GPG key"
    echo "  --obsidian       Add Obsidian repository and GPG key"
    echo "  --vscode         Add Visual Studio Code repository and GPG key"
    echo "  --all            Add all supported repositories and GPG keys"
    echo "  -h, --help       Display this help message"
}

# =============================================================================
# Function: setup_qbittorrent
# Description: Adds qBittorrent PPA and imports its GPG key
# =============================================================================
setup_qbittorrent() {
    echo "Setting up qBittorrent repository..."

    # Add the qBittorrent PPA
    sudo add-apt-repository -y ppa:qbittorrent-team/qbittorrent-stable

    echo "qBittorrent repository added successfully."
}

# =============================================================================
# Function: setup_obsidian
# Description: Adds Obsidian repository and imports its GPG key
# =============================================================================
setup_obsidian() {
    echo "Setting up Obsidian repository..."

    # Import Obsidian GPG key
    wget -qO- https://obsidian.md/pgp/pubkey.gpg | sudo gpg --dearmor -o /usr/share/keyrings/obsidian-archive-keyring.gpg

    # Add Obsidian repository
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/obsidian-archive-keyring.gpg] https://downloads.obsidian.md/obsidian/apt stable main" | sudo tee /etc/apt/sources.list.d/obsidian.list

    echo "Obsidian repository added successfully."
}

# =============================================================================
# Function: setup_vscode
# Description: Adds Visual Studio Code repository and imports its GPG key
# =============================================================================
setup_vscode() {
    echo "Setting up Visual Studio Code repository..."

    # Import Microsoft GPG key
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /usr/share/keyrings/microsoft-archive-keyring.gpg > /dev/null

    # Add VSCode repository
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list

    echo "Visual Studio Code repository added successfully."
}

# =============================================================================
# Function: parse_arguments
# Description: Parses command-line arguments and sets flags accordingly
# =============================================================================
parse_arguments() {
    if [[ $# -eq 0 ]]; then
        echo "Error: No options provided."
        show_help
        exit 1
    fi

    while [[ $# -gt 0 ]]; do
        case "$1" in
            --qbittorrent)
                APPS+=("qbittorrent")
                shift
                ;;
            --obsidian)
                APPS+=("obsidian")
                shift
                ;;
            --vscode)
                APPS+=("vscode")
                shift
                ;;
            --all)
                APPS+=("qbittorrent" "obsidian" "vscode")
                shift
                ;;
            -h|--help)
                show_help
                exit 0
                ;;
            *)
                echo "Error: Unknown option '$1'"
                show_help
                exit 1
                ;;
        esac
    done
}

# =============================================================================
# Function: main
# Description: Main execution flow
# =============================================================================
main() {
    # Initialize an array to hold selected applications
    APPS=()

    # Parse the command-line arguments
    parse_arguments "$@"

    # Remove duplicate entries
    UNIQUE_APPS=($(echo "${APPS[@]}" | tr ' ' '\n' | sort -u | tr '\n' ' '))

    # Iterate over selected applications and set them up
    for app in "${UNIQUE_APPS[@]}"; do
        case "$app" in
            qbittorrent)
                setup_qbittorrent
                ;;
            obsidian)
                setup_obsidian
                ;;
            vscode)
                setup_vscode
                ;;
            *)
                echo "Warning: No setup function defined for '$app'"
                ;;
        esac
    done

    echo "All selected repositories and GPG keys have been added successfully."
    echo "You can now update your package list with 'sudo apt update' and install the applications."
}

# =============================================================================
# Execute the main function with all passed arguments
# =============================================================================
main "$@"
