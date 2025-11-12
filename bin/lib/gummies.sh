#!/usr/bin/env bash

_ICON_ERROR=""
_ICON_SUCCESS=""
_ICON_WARN=""
_ICON_STEP=""

log_error() {
    local text="$1"
    
    gum style \
        --foreground 9 \
        --bold \
        " $_ICON_ERROR $text"
    
}

log_success() {
    local text="$1"

    gum style \
        --foreground 10 \
        --bold \
        " $_ICON_SUCCESS $text"
}

log_warning() {
    local text="$1"

    gum style \
        --foreground 11 \
        --bold \
        " $_ICON_WARN $text"
}

log_step() {
    local text="$1"

    gum style \
        --foreground 2 \
        --bold \
        " $_ICON_STEP $text"
}
