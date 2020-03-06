#!/usr/bin/bash

sudo echo "\n[archlinuxcn]\nServer = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch" >> /etc/pacman.conf

sudo pacman -Syyu archlinuxcn-keyring archlinux-keyring
sudo pacman -S yay

yay -Syyu
yay -S - < package_list.txt

# git config
cp gitconfig ~/.gitconfig

# install font
git clone https://github.com/powerline/fonts.git --depth=1 ~/Downloads/fonts
bash ~/Downloads/fonts/install.sh
git clone https://github.com/purifiedh2o/San-Francisco-family.git ~/Downloads/

# editor config
cp vimrc ~/.vimrc
git clone https://github.com/cycleke/.emacs.d.git ~/.emacs.d

# zsh config
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/sukkaw/zsh-proxy.git ~/.oh-my-zsh/custom/plugins/zsh-proxy
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
cp zshrc ~/.zshrc
cp zshenv ~/.zshenv

# tmux config
git clone https://github.com/gpakosz/.tmux ~/.tmux
cp tmux.conf.local ~/.tmux.conf.local

# xprofile
cp xprofile ~/.xprofile
cp Xresources ~/.Xresources

# fbterm config
cp fbtermrc ~/.fbtermrc
cp fbterm-wallpaper.sh ~/fbterm-wallpaper.sh

# i3 config
cp -r i3 ~/.i3
cp i3status.conf ~/.i3status.conf

# mail config
cp -r mutt ~/.mutt
cp mailcap ~/.mailcap
cp msmtprc ~/.msmtprc
cp procmailrc ~/.procmailrc
cp fetchmailrc ~/.fetchmailrc

# other config
cp -r config/* ~/.config/

# install some softwares
mkdir ~/Softwares

cd ~/Softwares
git clone https://github.com/Microsoft/python-language-server.git
cd python-language-server/src/LanguageServer/Impl
dotnet build -c Release
dotnet publish -c Release -r linux-x64

cd ~/Softwares
git clone https://github.com/okraits/j4-make-config.git
j4-make-config/j4-make-config -r wc8

cd ~/Softwares
git clone https://github.com/cycleke/st
git clone https://github.com/cycleke/dwm
