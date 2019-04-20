#!/usr/bin/env bash
#
# Specfic aliases and commands for my ROOT environments
alias jobs="env TERM_CHILD=1 bundle exec rake resque:work COUNT=1 QUEUE=*"
alias rs="bundle exec rails s -b 0.0.0.0"
alias mig="bin/rake db:migrate"
alias ecrlogin=`aws ecr --no-include-emai get-login`
alias sprof="source ${HOME}/.bashrc"
alias rd="~/code/dev-box/tools/root-developer/bin/root-developer"
alias update-ios='cdios; git rebase -X theirs master; cdrn; yarn bundle:ios; cdios; pod install; bin/run-synx'
alias ngrok="~/Applications/ngrok"
alias abrl='./gradlew assembleLocal && android-local && android-log'

function android_referrer(){
  echo "setting referrer to: 'http://r.joinroot.com/P:$1'"
  echo "am broadcast -a com.android.vending.INSTALL_REFERRER -n 'com.joinroot.root/com.jdc.reactlibrary.ReferrerReceiver' --es 'referrer' 'http://r.joinroot.com/p:$1'; exit" | adb shell
}

export RBENV_VERSION=''

function lint(){
  if [ -e .eslintrc.json ]; then
    yarn lint
  fi

  if [ -e .rubocop.yml ]; then
    be rake rubocop
  fi
}

rm ~/.config/nvim
rm ~/.tmux.conf
ln -s ~/code/dotfiles/nvim/ ~/.config/nvim
ln -s ~/code/dotfiles/tmux.conf ~/.tmux.conf

nvm use default --silent
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Applications/google-cloud-sdk/path.bash.inc' ]; then . '/Applications/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Applications/google-cloud-sdk/completion.bash.inc' ]; then . '/Applications/google-cloud-sdk/completion.bash.inc'; fi
