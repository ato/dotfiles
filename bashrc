#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias sl=ls
alias vi=vim

HISTSIZE=1000000
PS1='[\u@\h \W]\$ '
