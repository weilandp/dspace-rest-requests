#!/bin/bash

if [ $# != 3 ]; then
  echo -e "ERROR! Wrong number parameter!"
  echo -e "USE:"
  echo -e "${0} <DSPACEURL> <TOKEN> <DSPACE_VERSION: [4,5,6]>"
  exit 1
fi

DSPACEURL=${1}
TOKEN=${2}
DSPACE_VERSION=${3}

TYPE="json"
VERB="POST"
ACTION="logout"

if [[ ${DSPACE_VERSION} == 6 ]]; then
  AUTH="--cookie \"JSESSIONID=${TOKEN}\""
else
  AUTH="-H \"rest-dspace-token: ${TOKEN}\""
fi

echo -e "curl -k -4 \
  ${AUTH} \
  -H \"accept: application/${TYPE}\" \
  -H \"Content-Type: application/${TYPE}\" \
  -X ${VERB} \"${DSPACEURL}/${ACTION}\""


curl -k -4 \
  ${AUTH} \
  -H "accept: application/${TYPE}" \
  -H "Content-Type: application/${TYPE}" \
  -X ${VERB} "${DSPACEURL}/${ACTION}"

echo ""
