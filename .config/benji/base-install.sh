#!/usr/bin/bash

# Get Updates
sudo pacman -Sy

# System Stuff
sudo pacman -S --noconfirm              \
linux linux-firmware linux-headers      \
base base-devel                         \
efibootmgr                              \
btrfs-progs zram-generator

# Processor and GPU Things
sudo pacman -S --noconfirm              \
intel-ucode sof-firmware                \
xf86-video-intel dkms nvidia-dkms       \
libva-nvidia-driver nvidia-prime        \
nvidia-settings

# Networking
sudo pacman -S --noconfirm bluez        \
bluez-utils bluetui networkmanager      \
iwd network-manager-applet              \
wireless_tools

# Audio
sudo pacman -S --noconfirm              \
pipewire                                \
gst-plugin-pipewire                     \
pipewire-alsa pipewire-jack             \
pipewire-pulse wireplumber

# CLI Stuff
sudo pacman -S --noconfirm              \
brightnessctl fastfetch git htop jq     \
man-db nano playerctl rclone            \
smartmontools unzip wget zip zsh

# Install yay
if ! command -v yay &>/dev/null; then
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
    rm -rf yay
    yay -Sy
fi

# Hyprland Backend
sudo pacman -S --noconfirm              \
greetd hyprland uwsm                    \
qt5-wayland qt6-wayland                 \
xdg-desktop-portal-hyprland             \
xorg-xinit
yay -S --no-confirm howdy-git

# Autologin
sudo tee /etc/greetd/config.toml > /dev/null << 'EOF'
[terminal]
vt = 1
[default_session]
command = "sh /etc/greetd/bootmode"
user = "benji"
EOF

# Desktop Stuff
sudo pacman -S --noconfirm              \
dunst grim hyprbar hyprlock hyprpaper   \
kitty pavucontrol rofi-wayland slurp
yay -S --noconfirm brave-bin

# Install eww
git clone https://github.com/elkowar/eww
cd eww
cargo build --release --no-default-features --features=wayland
chmod +x target/release/eww
sudo mv target/release/eww /usr/bin/
cd ..
rm -rf eww

# Set default shell
sudo chsh -s $(which zsh) benji >/dev/null 2>&1

# Install ohmyzsh (if needed)
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    export RUNZSH=no CHSH=no KEEP_ZSHRC=yes && \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

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
#  - razer-laptop-control-no-dkms
#  - howdy
#  - xpadneo-dkms (for Xbox Elite Series 2 Support)
