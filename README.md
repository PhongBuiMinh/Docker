# 🐳 Dockerized Environment Runner

This project provides a flexible way to package and run the code inside different Docker environments — such as valgrind or ai — without worrying about OS-specific binaries or manual setup.

---

## 🚀 What This Project Does

- Packages the source code and runs it inside a selected Docker environment.
- Automatically starts Docker if it's not already running.
- Supports multiple environments like `valgrind` and `ai`, each defined by its own Dockerfile.
- Supports cleanup commands to remove unused containers, images, and volumes.
❗Avoids pushing compiled binaries (`.a`, `.o`, etc.) which are OS-dependent.

---

## ⚙️ Setup Instructions

### 1. Modify the Project Path

Open the Makefile and update this line to match your local project directory:

```make
PATH_TO_PROJECT = /your/local/path/to/project
```

This path will be mounted into the Docker container.

### 2. Select and Run an Environment

Each environment is defined by a Dockerfile located in the env/ directory. To run your project inside a specific environment, use:

```make
make valgrind   # Runs inside the valgrind environment
make ai         # Runs inside the ai environment
```

### Cleanup Commands

Use these commands to manage Docker resources:

```make
make clean      #Removes stopped containers and unused resources.
make fclean     # Forcefully removes all containers, images, volumes — use with caution.
```

