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
   docker run --rm -it -v $PWD:/wdr -w /wdr image # Links host directory to container. Enables access to external files.
   docker run --rm -it image                      # Uses only internal container files. No access to host system.
	```
-v $PWD:/wdr: Mounts current directory into container at /wdr
-w /wdr: Sets working directory inside container

## ⚖️ Copy vs Mount
-COPY: Adds files during build (static snapshot)
-MOUNT: Shares files during run (dynamic access)

## 📜 Dockerfile Commands

Command	Description
FROM	Specifies base image
COPY	Copies files from host into image
ADD	Downloads files from URLs
RUN	Executes commands during image build
CMD	Default command to run in container
ENTRYPOINT	Fixed command that can't be overridden
MAINTAINER	Author of the Dockerfile
WORKDIR	Sets working directory inside container

## 🧱 Docker Architecture

Layer	Role
Client	Sends commands (build, pull, run)
Docker Host	Runs Docker daemon (manages images & containers)
Registry / Hub	Stores static images (e.g., Docker Hub)

## ⚙️ Docker Engine Components

Component	Role
Server	Manages images, containers, volumes, networks
REST API	Interface between client and server
Client (CLI)	Command-line tool to interact with Docker

## ☁️ Docker Hub

Docker Hub is a cloud-based registry for storing and sharing Docker images.

### Common Commands
```bash
docker run     # Run a container
docker pull    # Download image
docker ps      # List running containers
docker stop    # Stop a container
docker start   # Start a container
docker login   # Authenticate with Docker Hub
```

## 🧩 Docker Objects

Object	Description
Image	Read-only template for containers
Container	Executable instance of an image
Volume	Persistent data storage shared across containers
Storage Driver	Low-level mechanism for managing container filesystems
Network	Connects containers to each other and the outside world

<!--
🧑‍🍳 Docker Restaurant Analogy
Concept	Analogy
Docker Daemon	👨‍🍳 Chef (does the work)
Docker Image	📖 Recipe (instructions)
Docker Container	🍽️ Meal (final product)
Docker Volume	🧺 Pantry (persistent ingredients/data)

🗃️ Storage Driver vs Volume
Action	Role of Storage Driver
Create volume	Allocates space on host filesystem
Mount volume	Integrates volume into container FS
Read/write data	Manages how data is stored/retrieved
Delete volume	Cleans up data and metadata
--!>
