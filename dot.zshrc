autoload -U compinit
compinit

export LANG=ja_JP.UTF-8

case $TERM in
linux) export LANG=C;;
*) export LANG=ja_JP.UTF-8
esac

alias ls='ls --color=auto'
alias ll='ls -l'

alias nkf='nkf -w'
alias iconv='iconv -f UTF8 -t EUCJP'
alias tree='tree -C'
alias ufws='sudo ufw status'

# work screen operation
alias sc='screen'
alias scl='screen -ls'
alias sr='sc -r'
alias sw='sr work'
alias swc='sc -S work'


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
