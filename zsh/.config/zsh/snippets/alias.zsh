# python
alias pip="pip3" py="python3" py2="python2" ipy="ipython"

# tmux
alias ta="tmux attach -t"
alias tad="tmux attach -d -t"
alias ts="tmux new-session -s"
alias tl="tmux list-sessions"
alias tksv="tmux kill-server"
alias tkss="tmux kill-session -t"

# trash
alias rm="trash-put" rt="trash-restore" re="trash-empty"

# 杂七杂八
alias h="tldr"
alias vi="nvim"
alias ra="ranger"
alias rgc='rg --color=always'
alias ec="emacsclient -c -a \"\""
alias et="emacsclient -t -a \"\""
alias pa='curl -F "c=@-" "http://fars.ee/" < '
alias hdu='du -sk -- * | sort -n | perl -pe '\''@SI=qw(K M G T P); s:^(\d+?)((\d\d\d)*)\s:$1." ".$SI[((length $2)/3)]."\t":e'\'''
