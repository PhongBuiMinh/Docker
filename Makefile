valgrind:
	docker run -it -v $(PWD):/tmp (-w /tmp) valgrind:1.0 \
	/bin/sh -c "g++ get_next_line.c get_next_line_utils.c && \
	valgrind ./a.out"
