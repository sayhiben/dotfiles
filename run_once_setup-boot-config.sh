#!/bin/bash
# Apply Raspberry Pi boot config for HyperPixel display

# Device-specific check - only run on "termyte" (Pi Zero 2 W with HyperPixel)
if [ "$(hostname)" != "termyte" ]; then
    echo "Not on termyte device, skipping HyperPixel boot config..."
    exit 0
fi

# Alternative: Check for specific Pi model
if ! grep -q "Pi Zero 2 W" /proc/cpuinfo 2>/dev/null && \
   ! grep -q "Pi Zero 2 W" /sys/firmware/devicetree/base/model 2>/dev/null; then
    echo "Not a Pi Zero 2 W, skipping boot config..."
    exit 0
fi

if [ -f /boot/firmware/config.txt ]; then
    CONFIG_FILE="/boot/firmware/config.txt"
elif [ -f /boot/config.txt ]; then
    CONFIG_FILE="/boot/config.txt"
else
    echo "Boot config not found, skipping..."
    exit 0
fi

# Check if fixes already applied
if grep -q "# Screen tearing fixes" "$CONFIG_FILE" 2>/dev/null; then
    echo "Boot config already updated"
    exit 0
fi

echo "Updating Raspberry Pi boot config for screen tearing fixes..."
sudo bash -c "cat >> $CONFIG_FILE << EOF

# Screen tearing fixes
gpu_mem=128
hdmi_force_hotplug=1
config_hdmi_boost=4
EOF"

echo "Boot config updated. Reboot required for changes to take effect."