#!/usr/bin/env bash

# This is the file where all the gum styles are located
# This file will be imported in any of the other files

set_styles() {
    # INPUT
    export GUM_INPUT_CURSOR_FOREGROUND="#76946A"
    export GUM_INPUT_PROMPT_FOREGROUND="#76946A"

    # CHOOSE
    export GUM_CHOOSE_HEADER_FOREGROUND="#76946A"
    export GUM_CHOOSE_CURSOR_FOREGROUND="#76946A"
    export GUM_CHOOSE_ITEM_FOREGROUND="#2A2A2A"

    # CONFIRM
    export GUM_CONFIRM_PROMPT_FOREGROUND="#76946A"
    export GUM_CONFIRM_SELECTED_FOREGROUND="#2A2A2A"
    export GUM_CONFIRM_SELECTED_BACKGROUND="#76946A"
    export GUM_CONFIRM_UNSELECTED_FOREGROUND="#76946A"
    export GUM_CONFIRM_UNSELECTED_BACKGROUND="#2A2A2A"
}
