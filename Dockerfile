# Create image based on the official Node 10 image from dockerhub
FROM node:10-alpine

# update libraries
RUN apk update && apk upgrade && apk add --no-cache tini bash git openssh

ENTRYPOINT ["/sbin/tini", "--"]

# Change directory so that our commands run inside this new directory
WORKDIR /src/app

# Copy dependency definitions including lock *
COPY package*.json ./

# Install dependecies
RUN npm install --frozen-lockfile

# Get all the code needed to run the app to container
COPY . .

# Expose the port the app runs in
EXPOSE 3000

#us
USER node

# Serve the app
CMD ["npm", "start"]




