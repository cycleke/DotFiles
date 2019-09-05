#!/usr/bin/bash

sudo echo '\n[archlinuxcn]\nServer = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch' >> /etc/pacman.conf

sudo pacman-mirrors -c China -m rank
sudo pacman -Syu
sudo pacman -S archlinuxcn-keyring archlinux-keyring yay

yay -Syyu
yay -S gcc gdb g++ cmake clang lldb llvm python ipython anaconda php curl jdk10-openjdk icedtea-web
yay -S terminator zsh git cheat htop v2ray
yay -S emacs vim vscodium-bin sublime-text-dev
yay -S fcitx fcitx-im fcitx-configtool fcitx-rime
yay -S wps-office firefox chromium keepass
yay -S texlive-most texlive-lang
yay -S p7zip zip unzip rar unrar

yay -S ttf-dejavu wqy-zenhei wqy-microhei nerd-fonts-complete
yay -S otf-san-francisco otf-san-francisco-pro ttf-monaco
yay -S clion pycharm-professional intellij-idea-community-edition
yay -S ccls dotnet-sdk

pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple --user
pip install infi.docopt-completion --user

git clone https://github.com/powerline/fonts.git --depth=1 ~/Downloads/fonts
bash ~/Downloads/fonts/install.sh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone -b develop https://github.com/syl20bnr/spacemacs ~/.emacs.d
git clone https://github.com/cycleke/Spacemacs-config ~/.spacemacs.d

cp zshrc ~/.zshrc
cp vimrc ~/.vimrc
cp xprofile ~/.xprofile
cp ./gitconfig ~/.gitconfig

cp -r cheat ~/.cheat
cp -r bin/* ~/.local/bin/
cp -r config/* ~/.config/

mkdir ~/Softwares
cd ~/Softwares
git clone https://github.com/Microsoft/python-language-server.git
cd python-language-server/src/LanguageServer/Impl
dotnet build -c Release
dotnet publish -c Release -r linux-x64
