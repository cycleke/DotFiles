set default_user "cycleke"

# Navigation
function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end

# Utilities
function grep     ; command grep --color=auto $argv ; end

# proxy configuration
set proxy_host socks5://127.0.0.1:7891
set proxy_auth false

# done configuration
set -U __done_min_cmd_duration 10000
set -U __done_exclude '(sudo|ra|ranger|man|open|vim|vi|nvim|emacs|emacsclient|latexmk)'

# highlighting inside manpages and elsewhere
set -gx LESS_TERMCAP_mb \e'[01;31m'       # begin blinking
set -gx LESS_TERMCAP_md \e'[01;38;5;74m'  # begin bold
set -gx LESS_TERMCAP_me \e'[0m'           # end mode
set -gx LESS_TERMCAP_se \e'[0m'           # end standout-modep
set -gx LESS_TERMCAP_so \e'[38;5;246m'    # begin standout-mode - info box
set -gx LESS_TERMCAP_ue \e'[0m'           # end underline
set -gx LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline

# Status Chars
#set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_char_upstream_equal ''
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_dirtystate 'red'

set __fish_git_prompt_color_upstream_ahead ffb90f
set __fish_git_prompt_color_upstream_behind blue

alias l="ls -lah"
alias pip="pip3"
alias py="python3"
alias py2="python2"
alias ipy="ipython"
alias vi="nvim"
alias ec="emacsclient -c -a \"\""
alias et="emacsclient -t -a \"\""
alias ra="ranger"

alias ta="tmux attach -t"
alias tad="tmux attach -d -t"
alias ts="tmux new-session -s"
alias tl="tmux list-sessions"
alias tksv="tmux kill-server"
alias tkss="tmux kill-session -t"

alias rm="trash-put"
alias hdu='du -sk -- * | sort -n | perl -pe '\''@SI=qw(K M G T P); s:^(\d+?)((\d\d\d)*)\s:$1." ".$SI[((length $2)/3)]."\t":e'\'''

alias g="git"
alias gp="git push"
alias gc="git commit -v"
alias gst="git status"
alias gaa="git add --all"
alias glog="git log --oneline --decorate --graph"
