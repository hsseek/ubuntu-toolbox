#!/bin/bash

SCRIPTS=(
  "anki/anki-cp-list"
  "firefox/casenote"
)

for script in "${SCRIPTS[@]}"; do
  ln -sf "$HOME/ubuntu-toolbox/$script.sh" "$HOME/.local/bin/$(basename $script)"
done

