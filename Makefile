DEFAULT= \033[0m
RED= \033[1;31m
GREEN= \033[1;32m

# Modify path to the project
PATH_TO_PROJECT = /your/local/path/to/project
WORKDIR = /docker/project

ai: run_ai
valgrind: run_valgrind

build_%:
	@echo "$(GREEN)Building $*...$(DEFAULT)"
	@docker build -f env/$* -t $* .

run_%: boot_docker build_%
	@echo "$(GREEN)Running $*...$(DEFAULT)"
	@docker run --rm -it -v $(PATH_TO_PROJECT):$(WORKDIR) $*

boot_docker:
	@docker info > /dev/null 2>&1 || (echo "Docker is not running. Starting it..." && bash scripts/docker_boot.sh)

clean:
	@echo "$(RED)Clearing unused and stopped resources...$(DEFAULT)"
	@docker system prune -y

fclean:
	@echo "$(RED)Removing everything...$(DEFAULT)"
	@docker system prune --all --volumes --force

.PHONY: run_% build_% ai valgrind clean fclean
