#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -z "$SSH_AUTH_SOCK" ]; then
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_github
    clear
fi

alias ls='ls -latr --color=auto'
alias grep='grep --color=auto'
alias walset='~/.dotfiles/scripts/walset-cli.sh'
PS1='[\u@\h \w]\$ '
export EDITOR=nvim
export SYSTEMD_EDITOR=nvim
