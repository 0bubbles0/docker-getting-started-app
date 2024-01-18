# Getting started

This repository is a sample application for users following the getting started guide at https://docs.docker.com/get-started/02_our_app/.


# Steps

## 1. Clone
```bash
$ git clone https://github.com/docker/getting-started-app.git
```

## 2. Build the app **image**
* `cd` into the project
* Create Dockerfile:
  ```bash
  $ touch Dockerfile
  ```

* Add to Dockerfile:
  ```Dockerfile
  # syntax=docker/dockerfile:1
    
  FROM node:18-alpine # download all required layers
  WORKDIR /app
  COPY . .
  RUN yarn install --production # install project dependencies
  CMD ["node", "src/index.js"] # Default command to run when starting a container from this image
  EXPOSE 3000
  ```

* Build the image
  ```bash
  $ docker build -t getting-started .
  ```

  * Docker needs to download all required layers (e.g. node:18-alpine version if it's not on my machine yet)
  * `-t getting-started` flag tags the image &rarr; can now call it by `getting-started` when I run a container
  * `.` &rarr; location of the Dockerfile

## 3. Start/Run an app **container**
```bash
$ docker run -dp 127.0.0.1:3000:3000 getting-started
```

  * `-d`: detach. Runs container in the background
  * `-p HOST:CONTAINER`: publish on port. E.g. map container's `3000` to `localhost:3000` (aka `127.0.0.1:3000`)

* Use todo app in browser under `localhost:3000`

## 4. List Docker containers
1. CLI:
```bash
$ docker ps
```

CONTAINER ID | IMAGE | COMMAND | CREATED | STATUS | PORTS | NAMES
--- | --- | --- | --- | --- | --- | ---
df784548666d | getting-started | "docker-entrypoint.s…" | 2 minutes ago | Up 2 minutes | 127.0.0.1:3000->3000/tcp | priceless_mcclintock

1. Docker Desktop app: in `Containers` tab

## 5. Update the app (image & container)
1. Edit something in the source code
1. Re-build the **image**:
```bash
  $ docker build -t getting-started .
```
1. Remove the **old container**:
```bash
  $ docker ps # gets you the container ID

  # a. Stop & remove container long:
  $ docker stop <the-container-id>
  $ docker rm <the-container-id>

  # b. Stop & remove container short:
  $ docker rm -f <the-container-id> # force

  # c. Click delete icon in the desktop-app
```
1. Start a **new container**:
```bash
  $ docker run -dp 127.0.0.1:3000:3000 getting-started
```

## 6. Docker & databases
