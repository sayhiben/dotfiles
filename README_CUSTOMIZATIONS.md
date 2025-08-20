# System Customizations

This document lists all the customizations found and preserved in these dotfiles.

## Display Configuration
- **HyperPixel 4 Display**: 480x800 @ 60Hz, rotated 90 degrees
- **Kanshi**: Display management configuration
- **Labwc**: Wayland compositor configuration
- **GPU Memory**: Increased to 128MB for better performance
- **Screen tearing fixes**: HDMI boost and VSync settings

## Development Environment
- **NVM**: Node Version Manager with Node.js v22
- **GitHub CLI**: Authenticated and configured
- **Claude Code**: Anthropic's AI coding assistant
- **Git**: Configured with user credentials

## System Services
- **CircuitPy Auto-mount**: SystemD services for USB device mounting at `/media/circuitpy`
  - Automatically mounts CircuitPython boards when connected
  - Configured with proper user permissions (uid=1000, gid=1000)

## Applications
- **Pico-8**: Fantasy console for game development
  - Configured for fullscreen borderless mode
  - Custom configuration saved

## Terminal Tools
- **htop**: System monitor with custom layout
- **nyancat**: Essential rainbow cat animation

## Package Dependencies
The following packages are automatically installed:
- wget, curl - Download tools
- htop - System monitor
- git - Version control
- vim - Text editor
- libsdl2-dev - SDL library for Pico-8
- nyancat - Terminal entertainment
- gh - GitHub CLI

## Raspberry Pi Specific
- Boot configuration optimized for HyperPixel display
- Display rotation handled at firmware level
- GPU memory allocation increased for smooth graphics

## Usage
All these customizations are automatically applied when using the install script:
```bash
curl -fsSL https://raw.githubusercontent.com/sayhiben/dotfiles/master/install.sh | sh
```

The chezmoi `run_once_` scripts handle:
1. Package installation
2. Boot configuration (Raspberry Pi only)
3. CircuitPy mount services
4. All configuration files are automatically placed