#!/bin/bash
apt update
apt install -y zsh git vlc ffmpeg gimp curl 

# Install Oh My Zsh
runuser -l benji -c 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"' || true

# Optional: change shell
chsh -s /bin/zsh benji

# Cleanup (remove systemd service)
rm /etc/systemd/system/postinstall.service
rm /usr/local/bin/postinstall.sh
systemctl disable postinstall.service
