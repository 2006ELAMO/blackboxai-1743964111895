#!/bin/bash

# Validate input file
if [ ! -f "$1" ]; then
  echo "Error: Input .rvz file not found"
  exit 1
fi

# Create temporary work directory
WORK_DIR=$(mktemp -d)
echo "Working in $WORK_DIR"

# Extract .rvz file
7z x "$1" -o"$WORK_DIR/game_files" > /dev/null

# Copy template files
cp templates/boot.elf "$WORK_DIR/"
cp templates/system.cnf "$WORK_DIR/"

# Build ISO
mkisofs -o "output/$(basename "$1" .rvz).iso" \
  -J -R -V "WII2PS2" \
  -b boot.elf -no-emul-boot \
  -boot-load-size 4 -boot-info-table \
  "$WORK_DIR"

# Cleanup
rm -rf "$WORK_DIR"
echo "ISO created at output/$(basename "$1" .rvz).iso"

# Size check
if [ $(du -b "output/$(basename "$1" .rvz).iso" | cut -f1) -gt 1700000000 ]; then
  echo "Warning: ISO exceeds 1.7GB limit"
fi