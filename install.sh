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
sudo apt install --fix-broken -y

# Install VS Code
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt update && sudo apt install -y code

# Install nerd fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Iosevka.zip
sudo unzip Iosevka.zip -d /usr/share/fonts/
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip
sudo unzip JetBrainsMono.zip -d /usr/share/fonts/ 
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
sudo unzip FiraCode.zip -d /usr/share/fonts/
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/IosevkaTerm.zip
sudo unzip IosevkaTerm.zip -d /usr/share/fonts/

sudo fc-cache -f -v
# Install OHMYZSH and plugins 
cd $HOME
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 
cd git/i3config-public
cp -r zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/
cp -r zsh-syntax-highlighting/ $HOME/.oh-my-zsh/custom/plugins/
cp -r zsh-autocomplete/ $HOME/.oh-my-zsh/custom/plugins/


sudo apt autoremove -y

sudo reboot

