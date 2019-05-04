# Create image based on the official Node 10 image from dockerhub
FROM node:10-alpine

# Change directory so that our commands run inside this new directory
WORKDIR /src/app

# Copy dependency definitions including lock *
COPY package*.json ./

# Install dependecies
RUN npm install

# Get all the code needed to run the app to container
COPY . .

# Expose the port the app runs in
EXPOSE 3000

# Serve the app
CMD ["npm", "start"]
