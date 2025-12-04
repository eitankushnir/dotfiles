ICONS_DIR="$HOME/.config/wlogout/icons/"
STYLE_SHEET="$HOME/.dotfiles/current/theme/waybar.css"

change_wlogout_icons() {
    color_code=$(cat "$STYLE_SHEET" | grep "foreground" | grep --only "#[0-9a-fA-F]\{6\}")

    for icon in "$ICONS_DIR"/*.svg; do
        sed -i "s/fill=\"#[0-9a-fA-F]\{6\}\"/fill=\"$color_code\"/g" "$icon"
    done
}
