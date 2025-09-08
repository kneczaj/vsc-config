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

if [ -L "$VCS_CONFIG_DIR" ]; then
    echo "VCS config directory is already linked. Skipping VCS config installation."
    exit 0
fi

echo "Installing VCS config..."

dir=$(realpath "${SCRIPT_DIR}")
target="${VCS_CONFIG_DIR}"
parentdir="$(dirname "$target")"
echo "$parentdir"
mkdir -p "${parentdir}"

echo "Linking \"$dir\" to \"$target\""

ln -s "$dir" "$target"
