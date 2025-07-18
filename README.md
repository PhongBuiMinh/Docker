## CREATE DOCKER IMAGE WITH DOCKERFILE
1. Create and name a Dockerfile.
2. Add instructions and commands in Dockerfile.
3. Build Dockerfile to create an image.
	- docker build -f /path/to/dockerfile -t <new_image> /path/to/build_source 
4. Run the image to create a container.
	- docker run -it -v $PWD:/tmp -w /tmp valgrind:1.0


## DOCKER FILE
DOCKER FILE (DSL(Domain Specific Language), instructions) -(build/compile)-> DOCKER IMAGE -(run)-> DOCKER CONTAINER


## DOCKERFILE COMMANDS
1. FROM (base image)
	- FROM <ImageName>

2. COPY (copy the file/folders to the image/diemond)
	- COPY <Source> <Destination> 

3. ADD (download files form HTTP/HTTPS)
	- ADD <URL> 

4. RUN (run scripts and commands while creating an image)
	- RUN < Command + ARGS>

5. CMD (start the process inside the container)
	- CMD [command + args]

6. ENTRYPOINT (run scripts and commands that cant be overridden)
	- ENTRYPOINT [command + args]

7. MAINTAINER (identify the author of the file)
	- MAINTAINER <NAME>

8. WORK_DIR (Set the working directory inside the container)
	- WORKDIR /ai


## ARCHITECTURE OF DOCKER
1. CLENT (docker file)
	- build, pull, run
2. DOCKER HOST (PC)
	- docker daemon (api) -> images + containers
3. REGISTRY / HUB (storage of static images)


## DOCKER HUB
REGISTRY / HUB (repository, cloud-based service; images)
Commands: run, pull, ps, stop, start, login


 ## DOCKER ENGINE
 1. Server (create, manage: images, netwoeks, volumes)
 2. REST API (interaction between server and application)
 3. Client (CLI interact with DOCKER)
  

## DOCKER OBJECTS
1. Images (read-only template)
2. Containers (start, stop, delete, move)
3. Storage deiver
   	- ???
4. Networking (link to many networks)
	- ???

