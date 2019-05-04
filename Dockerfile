# Create image based on the official Node 10 image from dockerhub
FROM node:10-alpine

# Change directory so that our commands run inside this new directory
WORKDIR /code

# Copy dependency definitions
COPY package*.json ./

# Install dependecies
RUN npm install

# Get all the code needed to run the app
COPY . .

# Expose the port the app runs in
EXPOSE 1337

USER node

# Serve the app
CMD ["npm", "start"]
