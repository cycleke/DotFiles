source ~/.config/zsh/zinit/bin/zinit.zsh

# p10k instant prompt
# 可取代 zplugin turbo mode
if [[ -r "$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ==== Zplugin 初始化 ====

typeset -A ZINIT=(
    BIN_DIR         $ZDOTDIR/zinit/bin
    HOME_DIR        $ZDOTDIR/zinit
    COMPINIT_OPTS   -C
)

source $ZDOTDIR/zinit/bin/zinit.zsh

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

forgit_add=gai
forgit_diff=gdi
forgit_log=glgi

ZSHZ_DATA=$ZDOTDIR/.z

zinit wait="1" lucid light-mode for \
      wookayin/fzf-fasd \
      wfxr/forgit

zinit light-mode for \
      blockf \
        zsh-users/zsh-completions \
      src="etc/git-extras-completion.zsh" \
        tj/git-extras

zinit wait="1" lucid for \
      OMZ::lib/clipboard.zsh \
      OMZ::lib/git.zsh \
      OMZ::lib/history.zsh \
      OMZ::plugins/git/git.plugin.zsh \
      OMZ::plugins/sudo/sudo.plugin.zsh

zinit svn for \
      OMZ::plugins/copyfile \
      OMZ::plugins/extract \
      OMZ::plugins/pip

zinit as="completion" for \
      OMZ::plugins/docker/_docker \
      OMZ::plugins/rust/_rust \
      OMZ::plugins/fd/_fd

zinit light-mode for \
      zdharma/fast-syntax-highlighting \
      zsh-users/zsh-autosuggestions \
      zpm-zsh/ls \
      SukkaW/zsh-proxy

# 杂乱文件 source
for i in $XDG_CONFIG_HOME/zsh/snippets/*.zsh; do
    source $i
done

eval "$(fasd --init auto)"
autoload -U compinit && compinit

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
 # This loads nvm bash_completion
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

# ==== 加载主题 ====

: ${THEME:=p10k}

case $THEME in
    pure)
        PROMPT=$'\n%F{cyan}❯ %f'
        RPROMPT=""
        zstyle ':prompt:pure:prompt:success' color cyan
        zinit ice lucid wait="!0" pick="async.zsh" src="pure.zsh" atload="prompt_pure_precmd"
        zinit light Aloxaf/pure
        ;;
    p10k)
        source $XDG_CONFIG_HOME/zsh/p10k.zsh
        zinit ice depth=1
        zinit light romkatv/powerlevel10k
        ;;
esac
