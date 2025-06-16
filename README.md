//////////////////////////////////////////////////////////////////////////////
CREATE DOCKER IMAGE FROM DOCKERFILE

1. Create and name a Dockerfile.
2. Add instructions and commands in Dockerfile.
3. Build Dockerfile to create an image.
	docker build -f /path/to/dockerfile -t <new_image> /path/to/build_source 
4. Run the image to create a container.
	docker run -it -v $PWD:/tmp -w /tmp valgrind:1.0

//////////////////////////////////////////////////////////////////////////////
DOCKERFILE COMMANDS
1. FROM (base image)
	FROM <ImageName>

2. COPY (copy the file/folders to the image/diemond)
	COPY <Source> <Destination> 

3. ADD (download files form HTTP/HTTPS)
	ADD <URL> 

4. RUN (run scripts and commands while creating an image)
	RUN < Command + ARGS>

5. CMD (start the process inside the container)
	CMD [command + args]

6. ENTRYPOINT (run scripts and commands that cant be overridden)
	ENTRYPOINT [command + args]

7. MAINTAINER (identify the author of the file)
	MAINTAINER <NAME>

8. WORK_DIR (Set the working directory inside the container)
WORKDIR /ai
