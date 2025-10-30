#!/bin/bash

# Check for image argument
if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/image"
    exit 1
fi

WALLPAPER="$1"

# Validate file
if [ ! -f "$WALLPAPER" ]; then
    echo "File does not exist: $WALLPAPER"
    notify-send ":("
    exit 2
fi

# Set wallpaper using hyprpaper
echo "Setting wallpaper..."
export PATH="$HOME/.cargo/bin:$PATH"
echo "preload = $WALLPAPER" > ~/.config/hypr/hyprpaper.conf
echo "wallpaper = ,$WALLPAPER" >> ~/.config/hypr/hyprpaper.conf
killall hyprpaper 2>/dev/null
hyprpaper &

# Generate theme with matugen
echo "Generating colors with matugen..."
matugen image $WALLPAPER -m "dark"
# Reload Waybar
pkill waybar && waybar &

# Reload Hyprland config (applies new color accents, if used)
hyprctl reload

echo "🎨 Theme applied successfully!"
