#!/bin/bash
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
xmacroplay "$DISPLAY" < "$SCRIPT_DIR/macros/anki-create-list
