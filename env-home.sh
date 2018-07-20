#!/usr/bin/env bash
#
# Source the .profile file
alias sprof="source ${HOME}/.profile"

# Specfic aliases and commands for my personal environments
alias evo="cd ${CODE_DIR}/evo"
alias ec="cd ${CODE_DIR}/evo/grails-app/assets/client"
alias mm="cd ${CODE_DIR}/motmot"

# Computers
alias pi1='ssh pi@10.0.1.31'
alias pi2='ssh pi@10.0.1.32'
alias firefly='ssh root@104.236.0.70'
alias motmot='ssh root@45.55.178.30'
alias evospace='ssh -L 3306:localhose:3306 root@104.131.86.143'
alias code="cd ${CODE_DIR}"

remap_internal_keyboard "1452-610"
remap_caps_lock

# versions
export NODE_VERSION="6.9.1"

export CODE_DIR="$(dirname "${SCRIPTS_DIR}")"

export NVM_DIR="${HOME}/.nvm"
[ -s "${NVM_DIR}/nvm.sh" ] && . "${NVM_DIR}/nvm.sh"  # This loads nvm

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# brew install bash_completion
[ -f /usr/local/etc/bash_completion ] && source /usr/local/etc/bash_completion
[ -f /usr/local/opt/git/etc/bash_completion.d/git-completion.bash ] && source /usr/local/opt/git/etc/bash_completion.d/git-completion.bash
[ -f /usr/local/opt/git/etc/bash_completion.d/git-prompt.sh ] && source /usr/local/opt/git/etc/bash_completion.d/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWCOLORHINTS=1

# https://unix.stackexchange.com/questions/28827/why-is-my-bash-prompt-getting-bugged-when-i-browse-the-history
# \[ and \] around parts that have zero display length
# color = \e[##m
# clear = \e[0m
PROMPT_COMMAND='__git_ps1 "\[\e[94m\]\u@\h\[\e[0m\] \w" "\\\$ "'

# Load versions and go to directory
nvm use $NODE_VERSION
code
