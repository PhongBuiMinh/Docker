#! /bin/bash

DEFAULT="\e[0m"
RED="\e[1;31m"
GREEN="\e[1;32m"

OS_TYPE="$(uname)"
echo "Starting Docker daemon on $OS_TYPE..."

if [ "$OS_TYPE" == "Darwin" ]; then
	open -a Docker
elif [ "$OS_TYPE" == "Linux" ]; then
	systemctl start docker
elif [ "$OS_TYPE" == "Windows" ]; then
	powershell.exe -Command "Start-Process 'Docker Desktop'"
else
	echo -e "${RED}Unsupported OS: $OS_TYPE$DEFAULT"
	exit 1
fi
