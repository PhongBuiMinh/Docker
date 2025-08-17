#! /bin/bash

cleanup_unix_like()
{
	echo "🚀 Starting Docker daemon..."
	if [[ "$1" == "Darwin" ]]; then
		open -a Docker
	else
		systemctl start docker
	fi

	echo "🧼 Starting Docker cleanup..."
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
	echo "✅ Docker cleanup complete."
}

cleanup_windows()
{
	echo "🚀 Starting Docker daemon..."
	powershell.exe -Command "Start-Process 'Docker Desktop'"
	# Start-Process "C:\Program Files\Docker\Docker\Docker Desktop.exe"

	echo "🧹 Cleaning up Docker..."
	# docker ps -q | xargs -r docker stop
	docker stop $(docker ps -q)

	# docker container prune -f
	docker rm $(docker ps -a -q)

	# docker image prune -a -f
	docker rmi $(docker images -q)

	# docker volume prune -f
	docker volume rm $(docker volume ls -q)

	# docker network prune -f
	docker network rm $(docker network ls -q)

	echo "✅ Docker cleanup complete for Windows."
}

echo "🔍 Detecting operating system..."
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
	echo "❌ Unsupported OS: $OS_TYPE"
	exit 1
fi
