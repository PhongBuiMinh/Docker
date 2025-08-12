all:
	@./docker_config.sh
# chmod 777 docker_config

ai: all
	docker build -f env/artificial_intelligence -t ai requirements
	docker run --rm -it ai

valgrind: all
	docker build -f env/valgrind -t valgrind requirements
	docker run --rm -it valgrind

# docker run -it -v $(PWD):/ valgrind:1.0 \
# /bin/sh -c "g++ get_next_line.c get_next_line_utils.c && \
# valgrind ./a.out"
