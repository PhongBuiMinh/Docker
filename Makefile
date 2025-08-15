PATH_TO_PROJECT = /Users/fbui-min/Desktop/github_cursus/Circle01/get_next_line
WORKDIR = /docker/program

all:
	@./docker_config.sh
# chmod 777 docker_config

build_ai:
	@docker build -f env/artificial_intelligence -t ai .

ai: build_ai
	@docker run --rm -it -v $(PATH_TO_PROJECT):$(WORKDIR) ai

build_valgrind:
	@docker build -f env/valgrind -t valgrind .

valgrind: build_valgrind
	@docker run --rm -it -v $(PATH_TO_PROJECT):$(WORKDIR) valgrind

.PHONY: build_ai ai build_valgrind build_valgrind

# docker run -it -v $(PWD):/ valgrind:1.0 \
# /bin/sh -c "g++ get_next_line.c get_next_line_utils.c && \
# valgrind ./a.out"
