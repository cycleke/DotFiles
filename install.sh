#!/usr/bin/bash

sudo echo '\n[archlinuxcn]\nServer = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch' >> /etc/pacman.conf

sudo pacman-mirrors -c China -m rank
sudo pacman -Syyu -noconfirm archlinuxcn-keyring archlinux-keyring yay

yay -Syyu
yay -S --noconfirm \
    gcc gdb cmake clang lldb llvm stack \
    python ipython anaconda php curl jdk10-openjdk icedtea-web \
    terminator zsh git htop v2ray qv2ray \
    emacs gvim vscodium-bin sublime-text-dev \
    fcitx fcitx-im fcitx-configtool fcitx-rime \
    wps-office firefox chromium keepass \
    texlive-most texlive-lang \
    p7zip zip unzip rar unrar \
    ttf-dejavu wqy-zenhei wqy-microhei nerd-fonts-complete \
    otf-san-francisco otf-san-francisco-pro ttf-monaco \
    clion pycharm-professional intellij-idea-community-edition \
    ccls dotnet-sdk-preview dotnet-runtime-preview dotnet-host-preview \
    ripgrep loc

pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple --user

git clone https://github.com/powerline/fonts.git --depth=1 ~/Downloads/fonts
bash ~/Downloads/fonts/install.sh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

cp zshrc ~/.zshrc
cp vimrc ~/.vimrc
cp xprofile ~/.xprofile
cp ./gitconfig ~/.gitconfig
cp -r config/* ~/.config/

mkdir ~/Softwares
cd ~/Softwares
git clone https://github.com/Microsoft/python-language-server.git
cd python-language-server/src/LanguageServer/Impl
dotnet build -c Release
dotnet publish -c Release -r linux-x64
