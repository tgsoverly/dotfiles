#!/usr/bin/env bash
#
# Specfic aliases and commands for my SPIDA environments
export ARTIFACTORY_USERNAME="developer"
export ARTIFACTORY_URL_BASE="https://dev.spidasoftware.com/artifactory"
export ARTIFACTORY_URL="${ARTIFACTORY_URL_BASE}/maven-repo"
export ARTIFACTORY_URL_EXPOSED="${ARTIFACTORY_URL_BASE}/exposed-repo"
export SPIDA_HOME="${HOME}/Library/Application Support/SPIDA/"

launchctl setenv SPIDA_HOME "$SPIDA_HOME",
launchctl setenv ARTIFACTORY_PASSWORD $ARTIFACTORY_PASSWORD
launchctl setenv ARTIFACTORY_USERNAME $ARTIFACTORY_USERNAME
launchctl setenv ARTIFACTORY_URL_BASE $ARTIFACTORY_URL_BASE
launchctl setenv ARTIFACTORY_URL $ARTIFACTORY_URL
launchctl setenv ARTIFACTORY_URL_EXPOSED $ARTIFACTORY_URL_EXPOSED

export HARVEST_SUBDOMAIN='spidasoftware'
export HARVEST_EMAIL='timothy.overly@spidasoftware.com'

export CATALINA_OPTS="-Xms1024m -Xmx2048m -XX:+CMSClassUnloadingEnabled -XX:PermSize=512m"
export JAVA_OPTS="-Xms128m -Xmx1024m"
export GRAILS_OPTS="-server -Xmx2048M -Xms768M -XX:PermSize=256m -XX:MaxPermSize=512m -Dfile.encoding=UTF-8"

export PATH=$PATH:"${CODE_DIR}/open-source/time-approver/lib"
export PATH=$PATH:"${CODE_DIR}/open-source/time-harvester"
export PATH=$PATH:"${CODE_DIR}/scripts/time-reporting/time-uploader"

remap_windows_keyboard "1118-1821"
remap_internal_keyboard "1452-610"
remap_caps_lock

alias spidasoftware="gcloud compute ssh toverly@spidasoftware-upgrade"

alias rvin='rm -rf ${CODE_DIR}/results-viewer/tmp && cd ${CODE_DIR}/calc/webviews && g c && g install && cd ${CODE_DIR}/calc/calc && g c && g r'

function install_deps(){
  npm install ember-cli@2.11 -g
  npm install grunt -g
  npm install bower -g
  npm install phantomjs -g
}
