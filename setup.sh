#!/bin/bash

SOURCE="$(dirname "$0")/Rprofile"
TARGET="$HOME/.Rprofile"

if [ -e "$TARGET" ]; then
  echo "You already have a ~/.Rprofile. Refusing to overwrite it."
else
  echo "Installing $SOURCE to ~/.Rprofile."
  ln -s "$SOURCE" "$TARGET"
fi
