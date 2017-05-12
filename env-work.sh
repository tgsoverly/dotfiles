#!/usr/bin/env bash
#
# Specfic aliases and commands for my SPIDA environments
export ARTIFACTORY_USERNAME="developer"
export ARTIFACTORY_URL_BASE="https://dev.spidasoftware.com/artifactory"
export ARTIFACTORY_URL="${ARTIFACTORY_URL_BASE}/maven-repo"
export ARTIFACTORY_URL_EXPOSED="${ARTIFACTORY_URL_BASE}/exposed-repo"

export HARVEST_SUBDOMAIN='spidasoftware'
export HARVEST_EMAIL='timothy.overly@spidasoftware.com'

export SPIDA_HOME="${HOME}/Library/Application Support/SPIDA/"

export CATALINA_OPTS="-Xms1024m -Xmx2048m -XX:+CMSClassUnloadingEnabled -XX:PermSize=512m"
export JAVA_OPTS="-Xms128m -Xmx1024m"
export GRAILS_OPTS="-server -Xmx2048M -Xms768M -XX:PermSize=256m -XX:MaxPermSize=512m -Dfile.encoding=UTF-8"

export PATH=$PATH:"${CODE_DIR}/open-source/time-approver/lib"
export PATH=$PATH:"${CODE_DIR}/open-source/time-harvester"
export PATH=$PATH:"${CODE_DIR}/scripts/time-reporting/time-uploader"

remap_windows_keyboard "1118-1821"
remap_internal_keyboard "1452-610"
