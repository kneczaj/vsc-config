#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

set -o allexport
source "${SCRIPT_DIR}/.env"
set +o allexport

set -e

if [ -d "$VCS_CONFIG_DIR" ]; then
    echo "VCS config directory exists. Skipping VCS config installation."
    exit 0
fi

echo "Installing VCS config..."

config_dir=$(realpath "./")

echo "Linking \"$config_dir\" to \"$VCS_CONFIG_DIR\""

ln -s "$config_dir" "$VCS_CONFIG_DIR"
