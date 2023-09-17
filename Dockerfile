# pull official base image
FROM node:16.15.1-alpine

#set timezone
ENV TZ=Europe/Amsterdam

# set working directory
WORKDIR /app

# Copies package.json and package-lock.json to Docker environment
COPY package*.json ./

# Installs all node packages
RUN npm install

# Copies everything over to Docker environment
COPY . .

# Build for production.
RUN npm run build

# Install `serve` to run the application.
RUN npm install -g serve

# Uses port which is used by the actual application
#EXPOSE 8080/UDP
#EXPOSE 8080/TCP
#EXPOSE 3000/UDP
#EXPOSE 3000/TCP
EXPOSE 3000
EXPOSE 8080

# Run application
#CMD [ "npm", "start" ]
CMD serve -s build