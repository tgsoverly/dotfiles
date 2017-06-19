#!/usr/bin/env bash
#
# Specfic aliases and commands for my ROOT environments
alias jobs="env TERM_CHILD=1 bundle exec rake resque:work COUNT=1 QUEUE=*"
alias rs="bundle exec rails s -b 0.0.0.0"
alias mig="bin/rake db:migrate"
alias ecrlogin=`aws ecr --no-include-emai get-login`
alias ealias="atom ${HOME}/code/dotfiles/aliases.sh"
alias eprof="atom ~/.my_profile"
alias sprof="source ${HOME}/.bashrc"

alias android-referrer="echo 'am broadcast -a com.android.vending.INSTALL_REFERRER -n \"com.joinroot.root/com.jdc.reactlibrary.ReferrerReceiver\" --es \"referrer\" \"utm_source=test_source&utm_medium=test_medium&utm_term=test_term&utm_content=test_content&utm_campaign=test_name\"; exit' | adb shell"
alias econfig='atom ~/code/dotfiles ~/code/dev-box'

export RBENV_VERSION=''

function lint(){
  if [ -e .eslintrc.json ]; then
    yarn lint
  fi

  if [ -e .rubocop.yml ]; then
    be rake rubocop
  fi
}

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
