sudo cp ./pacman.conf /etc/
sudo cp ./mirrorlist /etc/pacman.d/
sudo pacman -Syy
sudo pacman -S archlinuxcn-keyring archlinux-keyring
sudo pacman -S gcc g++ gdb cmake 
sudo pacman -S clang lldb 
sudo pacman -S python ipython 
sudo pacman -S php curl jdk10-openjdk icedtea-web
sudo pacman -S zsh terminator yay git
sudo pacman -S fcitx fcitx-im fcitx-configtool fcitx-rime
sudo pacman -S emacs vim firefox-nightly-zh-cn stardict wps-office

yay -Syyu
yay -S ttf-dejavu wqy-zenhei wqy-microhei nerd-fonts-complete lantern-bin
yay -S pycharm-community-edition intellij-idea-community-edition
yay -S python-pip
yay -S anaconda
yay -S p7zip

sudo pip install pip -U
sudo pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

git clone -b develop https://github.com/syl20bnr/spacemacs ~/.emacs.d
git clone git@github.com:cycleke/Spacemacs-config.git ~/.spacemacs.d
curl -sLf https://spacevim.org/install.sh | bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/powerline/fonts.git --depth=1 ~/Downloads/fonts
bash ~/Downloads/fonts/install.sh

wget http://www.dictinfo.com/stardict/wikt-en-ALL-2018-05-15.7z
mkdir -p ./stardict/dic/wikt-en-ALL-2018-05-15
7za x ./stardict/dic/wikt-en-ALL-2018-05-15/wikt-en-ALL-2018-05-15.7z -r

cp ./zshrc ~/.zshrc
cp ./bashrc ~/.bashrc
cp ./xprofile ~/.xprofile
cp ./gitconfig ~/.gitconfig
cp ./web-search.plugin.zsh ~/.oh-my-zsh/plugins/web-search/
cp -r ./config/ ~/.config/
cp -r ./stardict ~/.stardict

git clone git@github.com:d12frosted/elpa-mirror.git ~/elpa-mirror
