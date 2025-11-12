#!/usr/bin/env bash
source "./gummies.sh"

generate_colors_from_wallpaper() {
    local wallpaper="$1"
    if [[ -z "$wallpaper" ]]; then
        log_error "Error: No wallpaper provided"
        exit 1;
    fi

    if [[ ! -f "$wallpaper" ]]; then
        log_error "Error: Wallpaper file not found: $wallpaper"
    fi

    echo "Running Matugen..."
    if command -v matugen &> /dev/null; then
        matugen image "$wallpaper" -m "dark"
        log_success "Matugen colors generated"
    else
        log_warning "Warning: no matugen found"  
    fi
}


