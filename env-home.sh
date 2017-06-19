#!/usr/bin/env bash
#
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

remap_internal_keyboard "1452-610"
remap_caps_lock

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
