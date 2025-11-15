# syntax=docker/dockerfile:1

# Comments are provided throughout this file to help you get started.
# If you need more help, visit the Dockerfile reference guide at
# https://docs.docker.com/go/dockerfile-reference/

# Want to help us make this template better? Share your feedback here: https://forms.gle/ybq9Krt8jtBL3iCk7

ARG NODE_VERSION=24.0.0

FROM node:${NODE_VERSION}-alpine

# Use production node environment by default.
ENV NODE_ENV=production

WORKDIR /usr/src/app

# Download dependencies as a separate step to take advantage of Docker's caching.
# Leverage a cache mount to /root/.npm to speed up subsequent builds.
# Leverage a bind mounts to package.json and package-lock.json to avoid having to copy them into
# into this layer.
RUN --mount=type=bind,source=package.json,target=package.json \
    --mount=type=bind,source=package-lock.json,target=package-lock.json \
    --mount=type=cache,target=/root/.npm \
    npm ci --omit=dev

# Run the application as a non-root user.
USER node

# Copy the rest of the source files into the image.
COPY . .

# Expose the port that the application listens on.
EXPOSE 3000

# Run the application.
CMD ["node", "src/server.js"]

# a container is a running instance of an image
# an image is the artifact produce from a docker app
# docker images: to view images
# docker pull [name]:[version] - to pull an image
# docker run nginx:1.25.3 - to run an image
# docker run -d nginx:1.25.3 - to run in background
# docker ps: to view running containers
# docker init: to initialize docker in an existing project
# docker compose -f <yaml file name> up    === to specify a custom file name
# docker compose up --build: to run your application using docker
# docker compose up --build -d: run the application detached from the terminal by adding the -d option
# docker compose down: to stop the application.
# docker compose rm: to remove your containers.
# docker logs <container id>: to print logs of a particular container
# docker run -d -p <bind-port>:<original port>: to expose an application port to be accessible
# docker stop <container id or name>: to stop a particular container
# docker start <container id or name>: to start a particular container
# docker ps -a: list all container
# docker --help: for terminal docs 
# docker <command> --help: to get docs on a particular command
# docker run --name <new container name> -d nginx:1.25.3: to add a name to the container instead of auto generated name 
# docker build -t node-app:1.0.0 . ==== build a docker image from the working directory
# docker exec -it <containerID> /bin/bash or /bin/sh: Open interactive terminal inside the container.
# docker run -it nginx bash:  Open interactive terminal inside the container
# exit: to exit from the interactive terminal.
# docker network ls: list all docker network
# docker network create <network-name>
# docker rmi <image_id>   to delete a docker image.
# docker rm <container_id>  to delete a docker container.
# docker inspect <container_name> to view more details of a container