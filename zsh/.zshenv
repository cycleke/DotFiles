export PATH=~/bin:/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/share/dotnet:$HOME/.dotnet/tools:$HOME/bin:$HOME/.local/bin:$HOME/.local/bin:$HOME/.npm-global/bin:$HOME/bin
NPM_PACKAGES="${HOME}/.npm-global"
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

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

export CC='ccache gcc'
export CXX='ccache g++'

export DEFAULT_USER="cycleke"

# Local Variables:
# mode: sh
# End:
