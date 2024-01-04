# install nodejs version 19-alpine image on the container
FROM node:19-alpine

# copy all project files to /app/ folder
COPY . /app/

# switch to the current working directory
WORKDIR /app

# run npm install on ther container
RUN npm install

CMD [ "node", "src/server.js" ]