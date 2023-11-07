#! /bin/bash

# Installl pacakges needed for the configuration and corresponding .config folders

sudo apt install -y i3-wm xorg xbacklight xbindkeys xvkbd xinput xorg-dev
sudo apt install -y python3-pip gh cups
sudo apt install -y intel-microcode network-manager-gnome lxappearance thunar xfce4-settings xfce4-power-manager acpi acpid
sudo apt install -y kitty pulseaudio alsa-utils pavucontrol volumeicon-alsa neofetch htop exa bluez blueman 
sudo apt install -y firefox-esr nitrogen picom 
sudo apt install -y curl wget dmenu rofi dunst libnotify-bin lxpolkit unzip neovim gpg
sudo apt install -y fonts-font-awesome fonts-powerline fonts-ubuntu-title fonts-liberation2 fonts-liberation fonts-terminus 
sudo apt install -y lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings

# Enable the services that were installed
sudo systemctl enable lightdm
sudo systemctl enable bluetooth
sudo systemctl enable cups

#Update home directory
xdg-user-dirs-update

# Install Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt install --fix-broken

# Install VS Code
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt update && sudo apt install -y code

# Install OHMYZSH and plugins 
cd ../
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions
cp -r zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git 
cp -r zsh-syntax-highlighting/ $HOME/.oh-my-zsh/custom/plugins/
git clone https://github.com/marlonrichert/zsh-autocomplete.git 
cp -r zsh-autocomplete/ $HOME/.oh-my-zsh/custom/plugins/

# Install nerd fonts for the i3status bar and terminal
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"
curl -s 'https://api.github.com/repos/be5invis/Iosevka/releases/latest' | jq -r ".assets[] | .browser_download_url" | grep ttf-iosevka | xargs -n 1 curl -L -O --fail --silent --show-error

sudo apt autoremove -y

sudo reboot

