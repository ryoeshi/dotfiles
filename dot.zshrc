export LANG=ja_JP.UTF-8
export PATH=/usr/local/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:$PATH

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=1

autoload -U compinit && compinit

## options
setopt BASH_AUTO_LIST
setopt LIST_AMBIGUOUS
setopt AUTO_PUSHD

## history
HISTFILE="$HOME/.zsh_history"
HISTSIZE=16384
SAVEHIST=16384
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt share_history

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -lF'
alias la='ls -A'
alias l='ls -CF'

# diff aliases
alias diffdir='diff -rwB -I "^\s*\/" -I "^\s*\*" -I "^\s*\$" -I "\$\s*$" -x"*/CVS"'

# vps ssh
#alias vpssh='ssh -p 10022 ryoe@stone'
alias vpssh='ssh -p 10022 -o ConnectTimeout=180 ryoe@localhost'

# work screen operation
alias sc='screen'
alias scl='sc -ls'
alias sr='sc -rS'
alias sw='sr work'
alias swc='sc -S work'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

