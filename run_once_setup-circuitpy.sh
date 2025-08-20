#!/bin/bash
# Setup CircuitPy USB auto-mount services

# Check if we need to setup CircuitPy mount
if [ ! -f /etc/systemd/system/media-circuitpy.mount ]; then
    echo "Setting up CircuitPy auto-mount..."
    
    # Create mount point
    sudo mkdir -p /media/circuitpy
    
    # Create mount service
    sudo tee /etc/systemd/system/media-circuitpy.mount > /dev/null << 'EOF'
[Unit]
Description=Mount CIRCUITPY drive

[Mount]
What=/dev/disk/by-label/CIRCUITPY
Where=/media/circuitpy
Type=vfat
Options=uid=1000,gid=1000,umask=0002,flush

[Install]
WantedBy=multi-user.target
EOF

    # Create automount service
    sudo tee /etc/systemd/system/media-circuitpy.automount > /dev/null << 'EOF'
[Unit]
Description=Automount CIRCUITPY drive

[Automount]
Where=/media/circuitpy

[Install]
WantedBy=multi-user.target
EOF

    # Enable services
    sudo systemctl daemon-reload
    sudo systemctl enable media-circuitpy.mount
    sudo systemctl enable --now media-circuitpy.automount
    
    echo "CircuitPy auto-mount configured"
fi