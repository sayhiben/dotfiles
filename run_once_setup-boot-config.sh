#!/bin/bash
# Apply Raspberry Pi boot config for HyperPixel display

if [ -f /boot/firmware/config.txt ]; then
    CONFIG_FILE="/boot/firmware/config.txt"
elif [ -f /boot/config.txt ]; then
    CONFIG_FILE="/boot/config.txt"
else
    echo "Boot config not found, skipping..."
    exit 0
fi

# Check if we're on a Raspberry Pi
if ! grep -q "Raspberry Pi" /proc/cpuinfo 2>/dev/null; then
    echo "Not a Raspberry Pi, skipping boot config..."
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