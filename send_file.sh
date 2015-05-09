#!/bin/bash
source rest.cfg

if [ $# != 3 ]; then
  echo -e "ERROR! Wrong number of parameters!"
  echo -e "USE:"
  echo -e "${0} <TOKEN> <REQUEST_DECRIPTOR_FILE> <REQUEST_TYPE [\"json\"/\"xml\"]>"
  exit 1
fi

TOKEN=${1}
REQUEST=${2}
REQUEST_TYPE=${3}

if [ -e ${REQUEST} ]; then
  source $REQUEST
else
  echo "ERROR! Request descriptor file not found!"
  exit 1
fi

curl -k -4 \
  -H "rest-dspace-token: ${TOKEN}" \
  -H "accept: application/${REQUEST_TYPE}" \
	-X ${VERB} "${DSPACEURL}/${ACTION}" \
	-F upload=@"${FILE}"
