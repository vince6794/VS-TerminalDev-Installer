#/bin/bash
# install FiraCode Nerd Font --> u can choose another at: https://www.nerdfonts.com/font-downloads
echo "[-] Download fonts [-]"
echo "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
unzip FiraCode.zip -d ~/.fonts
unzip FiraCode.zip -d ~/.local/share/fonts
fc-cache -fv
echo "done!"
rm FiraCode.zip
