#!/bin/bash
set -e

CONFIG_PATH=/data/options.json
cat /data/options.json

SB_USER=$(jq --raw-output '.SB_USER' $CONFIG_PATH)
echo "SB_USER: ${SB_USER}"

if [[ -z $SB_USER ]]; then 
	echo "No User:Pass Set"
else
	echo "Setting UserName:Password"
	echo "SB_USER: ${SB_USER}"
	export SB_USER="${SB_USER}"
fi

/docker-entrypoint.sh -L 172.30.33.3 --cert /ssl/fullchain.pem  --key /ssl/privkey.pem
