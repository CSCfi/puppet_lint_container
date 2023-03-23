#!/bin/bash

CONTAINER_CMD=$(command -v docker)
if [ -z "${CONTAINER_CMD}" ]; then
    CONTAINER_CMD=$(command -v podman)
    if [ -z "${CONTAINER_CMD}" ]; then
        echo "I can't find a supported container manager (docker or podman). Please install and try again."
        exit 1
    fi
fi
export CONTAINER_CMD
