#!/usr/bin/bash

sudo cp pacman.conf /etc/pacman.conf
sudo sed -i "s/PKGEXT='.pkg.tar.xz'/PKGEXT='.pkg.tar'/g" /etc/makepkg.conf

sudo pacman -Syyu archlinuxcn-keyring archlinux-keyring
sudo pacman -S yay reflector
sudo reflector --verbose --country "China" -l 200 -p http --sort rate --save /etc/pacman.d/mirrorlist

yay -Syyu
yay -S - <package_list.txt

# tinytex
wget -qO- "https://yihui.org/gh/tinytex/tools/install-unx.sh" | sh
sh ./install_tex_package.sh

# git config
ln -s $PWD/gitconfig ~/.gitconfig

# install font
git clone https://github.com/powerline/fonts.git --depth=1 ~/Downloads/fonts
bash ~/Downloads/fonts/install.sh
git clone https://github.com/purifiedh2o/San-Francisco-family.git ~/Downloads/

# editor config
ln -s $PWD/vimrc ~/.vimrc
git clone https://github.com/cycleke/.emacs.d.git ~/.emacs.d

# zsh config
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/sukkaw/zsh-proxy.git ~/.oh-my-zsh/custom/plugins/zsh-proxy
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
ln -s $PWD/zshrc ~/.zshrc
ln -s $PWD/zshenv ~/.zshenv

# tmux config
git clone https://github.com/gpakosz/.tmux ~/.tmux
ln -s ~/.tmux/.tmux.conf ~/.tmux.conf
ln -s $PWD/tmux.conf.local ~/.tmux.conf.local

# xprofile
ln -s $PWD/xprofile ~/.xprofile

# other config
cp -r config/* ~/.config/
ln -s $PWD/scripts ~/scripts

# install some softwares
mkdir ~/Softwares

cd ~/Softwares

git clone https://github.com/cycleke/st
git clone https://github.com/cycleke/dwm
