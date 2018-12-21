#sudo cp ./pacman.conf /etc/
#sudo cp ./mirrorlist /etc/pacman.d/

sudo pacman -Syy
sudo pacman -S archlinuxcn-keyring archlinux-keyring yay

yay -Syyu
yay -S gcc gdb cmake clang lldb python ipython 
yay -S php curl jdk10-openjdk icedtea-web
yay -S terminator zsh git
yay -S fcitx fcitx-im fcitx-configtool fcitx-rime
#yay -S ibus-rime ibus-table ibus-qt
yay -S emacs vim firefox-developer-edition code
yay -S wps-office goldendict p7zip

yay -S ttf-dejavu wqy-zenhei wqy-microhei lantern-bin
yay -S pycharm-community-edition intellij-idea-community-edition anaconda

sudo pip install pip -U
sudo pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple -user

curl -sLf https://spacevim.org/install.sh | bash
git clone -b develop https://github.com/hlissner/doom-emacs ~/.emacs.d
git clone https://github.com/cycleke/doom-config.git ~/.doom.d

git clone https://github.com/powerline/fonts.git --depth=1 ~/Downloads/fonts
bash ~/Downloads/fonts/install.sh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

cp ./bashrc ~/.bashrc
cp ./zshrc ~/.zshrc
cp ./gitconfig ~/.gitconfig
cp ./web-search.plugin.zsh ~/.oh-my-zsh/plugins/web-search
cp ./xprofile ~/.xprofile
cp -r ./config/* ~/.config/
bash ./elpa-rsync.sh
