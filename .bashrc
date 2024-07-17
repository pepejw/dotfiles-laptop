#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source ble.sh
source ~/.local/share/blesh/ble.sh --noattach

# Setup::
# zoxide as cd in bash mode
# fzf in bash mode
# starship prompt in bash mode
# ssh keys to be auto-added
eval "$(zoxide init --cmd cd bash)"
eval $(fzf --bash)
eval "$(starship init bash)"
{ eval `ssh-agent`; ssh-add ~/.ssh/id_ed25519; } &>/dev/null

# setup comand-not-found hook
source /usr/share/doc/pkgfile/command-not-found.bash


# Aliases
# off = shutdown the computer
# ls = eza - better version
# grep = rg - better version
alias off='shutdown now'
alias ls='eza -a'
alias grep='rg'


bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'


#
[[ -f /usr/share/bash-preexec/bash-preexec.sh ]] && source /usr/share/bash-preexec/bash-preexec.sh

[[ ${BLE_VERSION-} ]] && ble-attach
