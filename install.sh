#! /bin/bash
mkdir -p /home/$USERNAME/.local/share/fonts
mkdir -p /home/$USERNAME/.local/share/themes

# Installl pacakges needed for the configuration and corresponding .config folders

sudo apt install -y i3-wm xorg xbacklight xbindkeys xvkbd xinput xorg-dev libu2f-udev 
sudo apt install -y python3-pip gh cups
sudo apt install -y intel-microcode network-manager-gnome lxappearance thunar xfce4-settings xfce4-power-manager acpi xfce4-terminal
sudo apt install -y kitty pulseaudio alsa-utils pavucontrol volumeicon-alsa neofetch htop exa bluez blueman 
sudo apt install -y firefox-esr nitrogen picom arc-theme breeze-cursor-theme
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
cd /home/$USERNAME/Downloads/
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb


# Install VS Code
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt update && sudo apt install -y code

# Install nerd fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.3/Iosevka.zip
sudo unzip Iosevka.zip -d /usr/share/fonts/
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip
sudo unzip JetBrainsMono.zip -d /usr/share/fonts/ 
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraCode.zip
sudo unzip FiraCode.zip -d /usr/share/fonts/
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/IosevkaTerm.zip
sudo unzip IosevkaTerm.zip -d /usr/share/fonts/

#Install nordic theme
wget https://github.com/EliverLara/Nordic/archive/refs/heads/master.zip
sudo unzip master.zip -d /usr/share/themes/



sudo apt autoremove -y

sudo reboot

