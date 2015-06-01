#!/bin/sh

if [ $# != 2 ]; then
  echo -e "ERROR! Wrong number of parameters!"
  echo -e "USE:"
  echo -e "${0} <DSPACEURL> <TOKEN>"
  exit 1
fi

DSPACEURL=${1}
TOKEN=${2}

TYPE="json"
VERB="POST"
ACTION="logout"

RQST="{
  \"email\":\"${EMAIL}\",
  \"password\":\"${PASSWORD}\"
}"

curl -k -4 \
  -H "rest-dspace-token: ${TOKEN}" \
  -H "accept: application/${TYPE}" \
  -H "Content-Type: application/${TYPE}" \
  -X ${VERB} "${DSPACEURL}/${ACTION}"

echo ""
echo "Logout occurred. No output means success, error output means error"
