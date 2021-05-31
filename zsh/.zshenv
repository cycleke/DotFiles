export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
export PATH=$PATH:/usr/local/dotnet:$HOME/.dotnet/tools
export PATH=$PATH:$HOME/bin:$HOME/.local/bin

export JAVA_HOME=/usr/lib/jvm/default
export HADOOP_HOME=$HOME/Applications/hadoop-3.3.0
export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin

export NPM_PACKAGES="${HOME}/.npm-global"
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"
export PATH=$PATH:$HOME/.npm-global/bin

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

ZDOTDIR=$XDG_CONFIG_HOME/zsh

export EDITOR="emacsclient -c -a \"\""
# export EDITOR="nvim"
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS="@im=fcitx5"
export QT_XKB_CONFIG_ROOT=/usr/share/X11/xkb

export LDFLAGS="-L/usr/local/opt/libxml2/lib"
export CPPFLAGS="-I/usr/local/opt/libxml2/include"
export PKG_CONFIG_PATH="/usr/local/opt/libxml2/lib/pkgconfig"

# export CC='ccache gcc'
# export CXX='ccache g++'

export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
export PATH=$PATH:$HOME/.local/share/cargo/bin

export DEFAULT_USER="cycleke"

# Local Variables:
# mode: sh
# End:
