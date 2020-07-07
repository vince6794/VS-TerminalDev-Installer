#!/bin/bash

# Install git and universal ctags
sudo apt install git universal-ctags --assume-yes

# Installing alacritty terminal
sudo add-apt-repository ppa:mmstick76/alacritty -y
sudo apt install alacritty --assume-yes
cp -r alacritty "$HOME"/.config

# Installing curl
sudo apt install curl --assume-yes

# Installing nodejs (for programs such as prettier)
sudo apt install nodejs npm --assume-yes

# Installing oh-my-zsh
sudo apt install zsh --assume-yes
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Installing NerdFont
chmod +x installFont.sh
./installFont.sh

# Installing gruvbox theme zsh
curl -L https://raw.githubusercontent.com/sbugzu/gruvbox-zsh/master/gruvbox.zsh-theme > $HOME/.oh-my-zsh/custom/themes/gruvbox.zsh-theme
sed -i 's/^plugins=.*/plugins=(git zsh-autosuggestions)/' "$HOME"/.zshrc
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="gruvbox"/' "$HOME"/.zshrc
sed -i 's/^SOLARIZE_THEME=.*//g' "$HOME"/.zshrc
sed -i '/^ZSH_THEME=.*/a SOLARIZE_THEME="dark"' "$HOME"/.zshrc

# Installing neovim
sudo apt install neovim --assume-yes

# Install plugin manager vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
cp -r nvim "$HOME"/.config/
nvim +PlugInstall +qall

# Install tmux
chmod +x installTmux.sh
./installTmux.sh

