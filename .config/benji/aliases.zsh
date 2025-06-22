alias zshconfig="nano ~/.zshrc"
alias ohmyzsh="nano ~/.oh-my-zsh"
alias hyprconf="nano ~/.config/hypr/hyprland.conf"

power() {
    local pstatus=$(cat "/sys/class/power_supply/BAT0/status")
    local pcapacity=$(cat "/sys/class/power_supply/BAT0/capacity")
    echo "$pstatus: $pcapacity%"
}

temps() {
    alias temps='echo "CPU Temp:"; sensors | grep -m 1 "Package id 0"; echo ""; echo "GPU Temp:"; nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader'
}
