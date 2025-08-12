#! /bin/bash

open -a Docker

CONTAINERS=$(docker ps -aq)
if [ "$CONTAINERS" != "" ]; then
	echo "Removing containers..."
	docker rm -f $CONTAINERS # -a (all containers); -q (container IDs)
else
	echo "No containers to remove."
fi
# docker container prune # remove stopped containers

echo "Pruning images..."
# docker image prune # remove unused images
docker image prune -a --force

echo "Pruning containers..."
docker volume prune --force

# docker system prune # remove s-containers, u-networks, d-images, b-cache
# echo "Cleaning docker"
# docker system prune --volumes --force # remove everything
