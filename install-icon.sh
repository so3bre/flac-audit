#!/bin/bash
# install-icon.sh - System-wide icon registration for FLAC-Audit

# Get the script directory to find assets regardless of execution path
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ICON_SOURCE="$SCRIPT_DIR/assets/icon.png"
ICON_DEST="$HOME/.local/share/icons/hicolor/scalable/apps/flac-audit.png"

echo "Installing icon to: $ICON_DEST"

# Ensure the destination directory exists
mkdir -p "$(dirname "$ICON_DEST")"

# Copy the icon
# Using cat to ensure a clean file copy
cat "$ICON_SOURCE" > "$ICON_DEST"

# Refresh the icon cache so the system recognizes the new icon immediately
if command -v gtk-update-icon-cache &> /dev/null; then
    gtk-update-icon-cache -f "$HOME/.local/share/icons/hicolor"
    echo "Icon cache updated."
else
    echo "Warning: gtk-update-icon-cache not found. You might need to refresh your icon theme manually."
fi

echo "Installation complete!"
echo "You can now set CREATE_DESKTOP_ICON=true in flac-audit.sh to enable folder branding."
