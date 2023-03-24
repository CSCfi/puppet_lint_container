#!/bin/bash

# shellcheck disable=SC1091,SC1090
source "$(dirname "${0}")/shared_functions.sh"

if "${CONTAINER_CMD}" container ls -a | grep -q puppet_lint; then
    # shellcheck disable=SC2048,SC2086
    "${CONTAINER_CMD}" exec -it \
        puppet_lint \
        bash $*
else
    # shellcheck disable=SC2048,SC2086
    "${CONTAINER_CMD}" run -it \
        -v "${HOME}:/home/${USER}" \
        --user "$(id -u)" \
        --rm \
        --network=host \
        --name puppet_lint puppet_lint \
        bash $*
fi
