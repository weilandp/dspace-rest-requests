#!/bin/bash

if [ $# != 4 ]; then
  echo -e "ERROR! Wrong number parameter!"
  echo -e "USE:"
  echo -e "${0} <DSPACEURL> <USER> <PASSWORD> <DSPACE_VERSION: [4,5,6]>"
  exit 1
fi

DSPACEURL=${1}
EMAIL=${2}
PASSWORD=${3}
DSPACE_VERSION=${4}

TYPE="json"
VERB="POST"
ACTION="login"

if [[ ${DSPACE_VERSION} == 6 ]]; then

  # DSPACE 6:
  RQST="email=${EMAIL}&password=${PASSWORD}"

  curl -k -4 -v \
  	-X POST "${DSPACEURL}/${ACTION}" \
  	-d "${RQST}"

else

  # DSPACE 4 and 5:
  RQST="{
    \"email\":\"${EMAIL}\",
    \"password\":\"${PASSWORD}\"
  }"

  echo -e "curl -k -4 \
    -H \"accept: application/${TYPE}\" \
    -H \"Content-Type: application/${TYPE}\" \
    -X ${VERB} \"${DSPACEURL}/${ACTION}\" \
    -d \"${RQST}\""


  curl -k -4 \
    -H "accept: application/${TYPE}" \
    -H "Content-Type: application/${TYPE}" \
    -X ${VERB} "${DSPACEURL}/${ACTION}" \
    -d "${RQST}"

fi


echo ""
