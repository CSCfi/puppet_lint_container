#!/bin/bash

# shellcheck disable=SC1091,SC1090
source "$(dirname "${0}")/shared_functions.sh"

cd "$(dirname "${0}")" || exit 1
"${CONTAINER_CMD}" build \
--network=host \
-t puppet_lint \
--build-arg username="${USER}" \
--build-arg userid="$(id -u)" \
--no-cache \
.
