# install nodejs version 19-alpine image on the container
FROM node:19-alpine

# copy all project files to /app/ folder. create the directory if it dosen't exits
COPY . /app/

# switch to the current working directory
WORKDIR /app

# run npm install on ther container
RUN npm install

CMD [ "node", "src/server.js" ]

# a container is a runing instance of an image
# an image is the artificat produce from a docker app
# docker images: to view images
# docker pull [name]:[version] - to pull an image
# docker run nginx:1.25.3 - to run an image
# docker run -d nginx:1.25.3 - to run in background
# docker ps: to view runing containers
# docker init: to initialize docker in an existing project
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
# docker build -t node-app:1.0.0 . - build a docker image from the working dirctory
# docker exec -it <containerID> /bin/bash: Open iteractive terminal inside the container.
# exit: to exit from the iteractive terminal.