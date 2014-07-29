#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias grep='grep --color=auto'
alias hc=herbstclient
alias ls='ls --color=auto'
alias man='man ' # force alias expansion
alias sl=ls
alias sudo='sudo ' # force alias expansion
alias vi=vim

export EDITOR=vim
export PAGER=less

HISTFILE=$HOME/.history_$HOSTNAME
HISTFILESIZE=100000
HISTSIZE=1000000
HISTTIMEFORMAT='%Y%m%d %T  '
PS1='\e[92m\u\e[39m@\e[92m\h\e[39m \e[94m\W\e[39m \$ '

shopt -s histappend

confirm() {
    read -p "Really do this on $HOSTNAME? [y/N] " -n 1 -r
    echo
    [[ $REPLY =~ ^[Yy]$ ]] && "$@"
}

if [[ -n "$SSH_CONNECTION" ]]; then
    alias halt='confirm halt'
    alias reboot='confirm reboot'
    PS1='\e[92m\u\e[39m@\e[93m\h\e[39m \e[94m\W\e[39m \$ '
fi

source /usr/share/bash-completion/completions/herbstclient 2>/dev/null
complete -F _herbstclient_complete -o nospace hc
