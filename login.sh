#!/bin/sh
source rest.cfg

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
