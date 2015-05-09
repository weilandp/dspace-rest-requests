#!/bin/sh
source rest.cfg

if [ $# != 1 ]; then
  echo -e "ERROR! Wrong number of parameters!"
  echo -e "USE:"
  echo -e "${0} <TOKEN>"
  exit 1
fi

TOKEN=${1}

TYPE="json"
VERB="POST"
ACTION="logout"

curl -k -4 \
  -H "rest-dspace-token: ${TOKEN}" \
  -H "accept: application/${TYPE}" \
  -H "Content-Type: application/${TYPE}" \
  -X ${VERB} "${DSPACEURL}/${ACTION}"

echo ""
echo "Logout occurred. No output means success, error output means error"
