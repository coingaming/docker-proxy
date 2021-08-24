#!/usr/bin/env bash

source "$(dirname "$0")/vars.sh"

function usage {
    echo "release.sh is a tool to build project docker image."
    echo ""
    echo "Usage: release.sh"
}

if [ "$1" = "help" ] || [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
  usage
fi

set -e

BUILD=`git rev-parse --short HEAD`

docker build \
		-t ${DOCKER_ORG}/${APP_NAME}:v${APP_VSN}-${BUILD} \
		-t ${DOCKER_ORG}/${APP_NAME}:latest .
