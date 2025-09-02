#! /bin/bash

DEFAULT="\e[0m"
RED="\e[1;31m"
GREEN="\e[1;32m"

cleanup_unix_like()
{
	echo "Starting Docker daemon on $1..."
	if [[ "$1" == "Darwin" ]]; then
		open -a Docker
	else
		systemctl start docker
	fi

	echo "Starting Docker cleanup..."

	CONTAINERS=$(docker ps -aq)
	if [ "$CONTAINERS" != "" ]; then
		echo "Removing containers..."
		docker rm -f $CONTAINERS
	else
		echo -e "${RED}No containers to remove.$DEFAULT"
	fi

	echo "Pruning volume..."
	docker volume prune --force

	echo "Pruning images..."
	docker image prune -a --force
}

cleanup_windows()
{
	echo "Starting Docker daemon on $1..."
	powershell.exe -Command "Start-Process 'Docker Desktop'"

	echo "Starting Docker cleanup..."
	docker stop $(docker ps -q)

	CONTAINERS=$(docker ps -a -q)
	if [ -n "$CONTAINERS" ]; then
		echo "Removing containers..."
		docker rm $CONTAINERS
	else
		echo -e "${RED}No containers to remove.${DEFAULT}"
	fi

	echo "Pruning volume..."
	docker volume rm $(docker volume ls -q)

	echo "Pruning images..."
	docker rmi $(docker images -q)
	# docker network rm $(docker network ls -q)
}

if command -v uname; then
	OS_TYPE="$(uname)"
else
	OS_TYPE="Windows"
fi

if [[ "$OS_TYPE" == "Linux" || "$OS_TYPE" == "Darwin" ]]; then
	cleanup_unix_like "$OS_TYPE"
elif [ "$OS_TYPE" == "Windows" ]; then
	cleanup_windows
else
	echo -e "${RED}Unsupported OS: $OS_TYPE$DEFAULT"
	exit 1
fi

echo -e "${GREEN}Docker cleanup complete.$DEFAULT"
