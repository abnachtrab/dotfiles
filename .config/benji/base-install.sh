#!/usr/bin/bash

# Get Updates
sudo pacman -Sy

# System Stuff
sudo pacman -S --noconfirm              \
linux linux-firmware linux-headers      \
base base-devel                        \
efibootmgr                              \
btrfs-progs zram-generator

# Processor and GPU Things
sudo pacman -S --noconfirm              \
intel-ucode sof-firmware                \
xf86-video-intel dkms nvidia-dkms      \
libva-nvidia-driver nvidia-settings    \

# CLI Stuff
sudo pacman -S --noconfirm              \
fastfetch git htop                     \
man-db nano rclone                     \
unzip wget zip zsh

# Install yay
if ! command -v yay &>/dev/null; then
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
    rm -rf yay
    yay -Sy
fi

# Desktop Stuff
sudo pacman -S --noconfirm kitty plasma
yay -S --noconfirm brave-bin

# Set default shell
sudo chsh -s $(which zsh) benji >/dev/null 2>&1

# Install ohmyzsh (if needed)
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    export RUNZSH=no CHSH=no KEEP_ZSHRC=yes && \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Update everything
sudo pacman -Syu --noconfirm
sudo yay -Syu --noconfirm

# Cleanup
rm -rf ~/.bash*
rm -f ~/.shell.pre-oh-my-zsh

# Done!
read -t 10 -p "Done! Reboot now? [y/N]: " answer
answer=${answer,,}
if [[ "$answer" == "y" ]]; then
    sudo reboot
fi

# Things that may be wanted, but do manually:
#  - howdy
#  - xpadneo-dkms (for Xbox Elite Series 2 Support)
