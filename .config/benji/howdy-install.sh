#!/usr/bin/bash

# Might have to ln g(++/cc) to g(++/cc)-13
if ! yay -T howdy-git >/dev/null 2>&1; then
    echo "Installing howdy using yay..."
    yay --noconfirm -S howdy
else
    echo "Howdy already installed, skipping download."
fi

echo "Copying hyprlock pam file..."
sudo cp ../install-files/hyprlock.pam /etc/pam.d/hyprlock

echo "Available video devices:"
if ! ls /dev/video* 2>/dev/null; then
    echo "No video devices found...?"
fi

echo "To configure Howdy, run this:"
echo "  sudo howdy config"
echo "Then set the device_path to the video device (/dev/videoX)"
echo "If it doesn't work, try a different device."
