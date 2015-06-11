#!/bin/bash

if [ $# != 3 ]; then
  echo -e "ERROR! Wrong number of parameters!"
  echo -e "USE:"
  echo -e "${0} <DSPACEURL> <EMAIL> <PASSWORD>"
  exit 1
fi

DSPACEURL=${1}
EMAIL=${2}
PASSWORD=${3}

TYPE="json"
VERB="POST"
ACTION="login"

RQST="{
  \"email\":\"${EMAIL}\",
  \"password\":\"${PASSWORD}\"
}"

curl -k -4 \
  -H "accept: application/${TYPE}" \
  -H "Content-Type: application/${TYPE}" \
  -X ${VERB} "${DSPACEURL}/${ACTION}" \
  -d "${RQST}"

echo ""
