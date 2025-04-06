# Wii to PS2 ISO Converter

## Requirements:
1. Linux/Unix system
2. Required packages: p7zip-full, genisoimage
3. Valid PS2 boot.elf file (replace the placeholder)

## Installation:
```bash
sudo apt-get install p7zip-full genisoimage
chmod +x convert.sh
```

## Usage:
1. Place your .rvz Wii game file in the converter directory
2. Replace templates/boot.elf with a valid PS2 boot executable
3. Run the converter:
```bash
./convert.sh your_game.rvz
```
4. Output ISO will be in the output/ directory

## Important Notes:
- The output ISO must be ≤1.7GB to be PS2 compatible
- The boot.elf placeholder WILL NOT WORK - you must provide a valid file
- Some Wii games may not convert properly due to system differences
- For best results, use original Wii disc images (not modified/homebrew)

## File Structure:
- convert.sh - Main conversion script
- templates/
  - boot.elf - PS2 boot executable (REPLACE THIS)
  - system.cnf - PS2 configuration file
- output/ - Contains converted ISO files

## Troubleshooting:
- If conversion fails, ensure:
  - You have all dependencies installed
  - Input file is a valid .rvz Wii image
  - You have write permissions in the directory