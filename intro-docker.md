## DOCKER
Docker sets up an isolated environment to run an application.
🔍 What That Means:
-Docker packages your app along with all its dependencies (libraries, tools, configs) into a container.
-This container runs in a lightweight, isolated environment—like a mini virtual machine, but faster and more efficient.
-The environment is defined by a Docker image, which acts as a blueprint for the container.


## Docker Build Lifecycle
DOCKER: FILE/instructions -(build/compile)-> IMAGE/blueprint -(run)-> CONTAINER/packed app


## CREATE DOCKER IMAGE WITH DOCKER FILE
DOCKER FILE - DSL(Domain Specific Language)
1. Create a Dockerfile.
2. Add instructions and commands in Dockerfile.
3. Reads the Dockerfile and executes all the instructions to create an image.
	- docker build -f /path/to/dockerfile -t <new_image> /path/to/build_context (This is the folder Docker uses as the build context. All COPY and ADD instructions in the Dockerfile refer to files relative to this folder. Docker sends the entire build context to the daemon, so it must include everything the Dockerfile needs)
4. Run the image to create a container.
	- docker run --rm -it -v $PWD:/tmp -w /tmp valgrind:1.0 (-w set /... as working directory, mounts $(PWD) folder(volume) into the container at /tmp) original workdir is hidden, The volume is mounted at /app, so it covers that location.
MOUNT run (dynamic) vs COPY build (finished project)
docker run -it -v $(PWD):/ valgrind:1.0 /bin/sh -c "g++ get_next_line.c get_next_line_utils.c && valgrind ./a.out"


## DOCKERFILE COMMANDS
1. FROM (base image)
	- FROM <ImageName>

2. COPY (copy the file/folders to the image/diemond. copy files from host machine (build context into the image's filesystem)) MOUNT (Host filesystem or Docker volume)
	- COPY <Source> <Destination> 

3. ADD (download files form HTTP/HTTPS)
	- ADD <URL> 

4. RUN (run scripts and commands while creating an image)
	- RUN <Command + ARGS>

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
registry (store docker images on a remote server) vs volume (store pesistent data for container on the host filesystem)

In the Docker Restaurant Analogy:
Chef = Docker Daemon The one doing all the work behind the scenes.
Recipe = Docker Image Instructions for how to make a specific dish (container).
Meal = Docker Container The final product, made from the recipe.
Pantry = Docker Volume A place to store ingredients (data) that the chef can use again and again—even after the meal is finished.


## DOCKER HUB
REGISTRY / HUB (repository, cloud-based service; images)
Commands: run, pull, ps, stop, start, login


 ## DOCKER ENGINE
 1. Server (create, manage: images, networks, volumes)
 2. REST API (interaction between server and application)
 3. Client (CLI interact with DOCKER)
  

## DOCKER OBJECTS
1. Images (read-only template)
2. Containers (start, stop, delete, move)
3. Storage driver - low-lvl mechanism (Filesystem Management),-> volume - high lvl abstraction (live outside of containers, sharing data between them) (hard drive).
   	- ???
4. Networking (link to many networks)
	- ???

Action	Role of Storage Driver
Create volume	Allocates space on host filesystem
Mount volume to container	Integrates volume into container FS
Read/write data	Manages how data is stored/retrieved
Delete volume	Cleans up data and metadata






# 🐳 Docker Essentials

Docker sets up an isolated environment to run an application.

## 🔍 What That Means

- Docker packages your app along with all its dependencies (libraries, tools, configs) into a **container**.
- This container runs in a lightweight, isolated environment—like a mini virtual machine, but faster and more efficient.
- The environment is defined by a **Docker image**, which acts as a blueprint for the container.

---

## 🔄 Docker Build Lifecycle
DOCKERFILE (instructions)
↓ build
IMAGE (blueprint)
↓ run
CONTAINER (packed app)


---

## 🛠️ Create Docker Image with Dockerfile

Dockerfile is a **DSL (Domain Specific Language)** for defining how to build an image.

### Steps

1. Create a `Dockerfile`.
2. Add instructions and commands.
3. Build the image:
   ```bash
   docker build -f /path/to/Dockerfile -t <new_image> /path/to/build_context
	```
	The build context is the folder Docker uses to locate files for COPY and ADD. Docker sends  the entire context to the daemon.
4. Run the image to create a container:
   ```bash
   docker run --rm -it -v $PWD:/tmp -w /tmp image # Links host directory to container. Enables access to external files.
   docker run --rm -it image                      # Uses only internal container files. No access to host system.
	```
	--v $PWD:/tmp: Mounts current directory into container at /tmp
	--w /tmp: Sets working directory inside container

## ⚖️ Copy vs Mount
-COPY: Adds files during build (static snapshot)
-MOUNT: Shares files during run (dynamic access)

