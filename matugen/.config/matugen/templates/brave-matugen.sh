#!/usr/bin/env bash
COLOR_HEX={{colors.primary.default.hex}}
COLOR_DEC=$((16"$COLOR_HEX"))

while pgrep -x brave; do
    :
done

STRING="$(jq -n --argjson dec "$COLOR_DEC" '{color_variant2:1,user_color2:$dec}')"
jq --argjson new_theme "$STRING" \
   '.browser.theme = $new_theme' \
   ~/.config/BraveSoftware/Brave-Browser/Default/Preferences \
   > ~/.config/BraveSoftware/Brave-Browser/Default/Preferences.tmp

mv ~/.config/BraveSoftware/Brave-Browser/Default/Preferences.tmp \
   ~/.config/BraveSoftware/Brave-Browser/Default/Preferences

if [[ -f /tmp/brave-browser-was-running ]] && grep -q 1 /tmp/brave-browser-was-running; then
    uwsm-app -- brave --disable-features=WaylandWpColorManagerV1 &
fi
