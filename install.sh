#!/bin/bash

# Install git and universal ctags
sudo apt install git universal-ctags --assume-yes

# Install kitty terminal
sudo apt install kitty --assume-yes
cp -r ./kitty ~/.config/kitty

# Installing curl
sudo apt install curl --assume-yes

# Install lua
sudo apt install lua5.4

# Installing oh-my-zsh
sudo apt install zsh --assume-yes
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Installing  theme zsh
curl -L https://raw.githubusercontent.com/sbugzu/gruvbox-zsh/master/gruvbox.zsh-theme > $HOME/.oh-my-zsh/custom/themes/gruvbox.zsh-theme
sed -i 's/^plugins=.*/plugins=(git zsh-autosuggestions)/' "$HOME"/.zshrc
#sed -i 's/^ZSH_THEME=.*/ZSH_THEME="gruvbox"/' "$HOME"/.zshrc
#sed -i 's/^SOLARIZE_THEME=.*//g' "$HOME"/.zshrc
#sed -i '/^ZSH_THEME=.*/a SOLARIZE_THEME="dark"' "$HOME"/.zshrc
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="spaceship"/' "$HOME"/.zshrc
echo 'SPACESHIP_VI_MODE_SHOW=false' >> "$HOME"/.zshrc

echo 'alias vim="nvim"' >> "$HOME"/.zshrc
echo 'bindkey -v' >> "$HOME"/.zshrc

# Installing NerdFont
./installFont.sh

# Installing neovim
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip
git clone https://github.com/neovim/neovim.git
cd neovim; make; sudo make install; cd ..

ln -s ~/.vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim

# Install plugin manager vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
cp -r nvim "$HOME"/.config/
#nvim +PlugInstall +qall

# Install tmux
sudo apt install tmux --assume-yes

# Install i3-gaps
sudo add-apt-repository ppa:aguignard/ppa
sudo apt-get update
sudo apt install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev \
libxcb-util0-dev libxcb-icccm4-dev libyajl-dev \
libstartup-notification0-dev libxcb-randr0-dev \
libev-dev libxcb-cursor-dev libxcb-xinerama0-dev \
libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev \
autoconf libxcb-xrm0 libxcb-xrm-dev automake libxcb-shape0-dev

git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps

mkdir -p build && cd build
meson ..
ninja
cd ../../
cp -r i3 ~/.config/i3
