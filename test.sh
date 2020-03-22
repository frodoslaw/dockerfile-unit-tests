#!/bin/bash
#

set -eEuo pipefail

# The first parameter is a Docker tag or image id
declare -r DOCKER_TAG="$1"

printf "Starting a container for '%s'\\n" "$DOCKER_TAG"

declare -r DOCKER_CONTAINER=$(docker run --rm -t -d "$DOCKER_TAG")

function tearDown {
    docker rm -f "$DOCKER_CONTAINER" &>/dev/null
}
trap tearDown EXIT TERM ERR

# Run tests
docker run --rm -t \
    -v "$(pwd)/test:/tests" \
    -v /var/run/docker.sock:/var/run/docker.sock:ro \
    renatomefi/docker-testinfra:1 \
    --verbose --hosts="docker://$DOCKER_CONTAINER"