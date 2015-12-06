#!/bin/bash

DAEMON_HOME="/root";
SCRIPT_PATH="/usr/local/rvm/scripts/rvm";
CONFIG_PATH="${DAEMON_HOME}/thin.yml";

[ -x "${SCRIPT_PATH}" ] || exit 2;
[ -d "${DAEMON_HOME}" ] || exit 3;
[ -f "${CONFIG_PATH}" ] || exit 4;


cd ${DAEMON_HOME};
source ${SCRIPT_PATH};
SCRIPT="${GEM_HOME}/bin/bundle exec";
PRESCRIPT="${GEM_HOME}/bin/bundle install";

if [ -e newapp ]; then
   \cp -rpf newapp/* /root/
fi

${PRESCRIPT}
${SCRIPT} foreman start -d . -p 3002

exit 0;


