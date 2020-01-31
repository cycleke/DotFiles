#!/usr/bin/bash

sudo echo "\n[archlinuxcn]\nServer = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch" >> /etc/pacman.conf

sudo pacman-mirrors -c China -m rank
sudo pacman -Syyu archlinuxcn-keyring archlinux-keyring yay

yay -Syyu
yay -S gcc gdb cmake clang lldb llvm ccls-git stack \
    python ipython anaconda php curl jdk10-openjdk jdk8-openjdk icedtea-web \
    dotnet-host-bin dotnet-runtime-bin dotnet-sdk-bin \
    alacrityy zsh tmux rofi git htop qv2ray \
    emacs gvim vscodium-bin sublime-text-dev \
    clion pycharm-professional intellij-idea-community-edition \
    fcitx fcitx-im fcitx-configtool fcitx-rime \
    wps-office kpcli nutstore texlive-most texlive-lang zathura pdfpc \
    firefox chromium w3m emacs-w3m-git emacs-elscreen-w3m emacs-elscreen \
    neomutt fetchmail msmtp procmail telegram-desktop \
    wqy-zenhei wqy-microhei nerd-fonts-complete ttf-monaco ttf-dejavu \
    ark p7zip zip unzip rar ranger ripgrep tldr loc fluxgui \
    youtube-dl mpv mplayer obs-studio \
    fbterm-git fbida fbpdf-git fbv fcitx-fbterm

# git config
cp gitconfig ~/.gitconfig

# install font
git clone https://github.com/powerline/fonts.git --depth=1 ~/Downloads/fonts
bash ~/Downloads/fonts/install.sh

# editor config
cp vimrc ~/.vimrc
git clone https://github.com/cycleke/.emacs.d.git ~/.emacs.d

# zsh config
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
cp zshrc ~/.zshrc

# tmux config
git clone https://github.com/gpakosz/.tmux ~/.tmux
cp tmux.conf.local ~/.tmux.conf.local

# xprofile
cp xprofile ~/.xprofile

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
