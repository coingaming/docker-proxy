#!/usr/bin/env bash

PROJECT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && cd ../ && pwd )"

ENV_NAME=${ENV_NAME:-$(git rev-parse --abbrev-ref HEAD)}
if [ "$ENV_NAME" == "master" ]; then
  ENV_NAME=${MASTER_ENV:-live}
fi

DOCKER_ORG=${DOCKER_ORG:-heathmont}

APP_NAME=docker-proxy
APP_VSN=0.1.0
