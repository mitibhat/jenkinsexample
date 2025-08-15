# Use an official Node.js runtime as a base image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (if present) to the working directory
# This allows npm install to leverage Docker's layer caching for dependencies
COPY package*.json ./

# Install application dependencies
RUN npm install

# Copy the rest of the application source code to the working directory
COPY . .

# Expose the port your Node.js application listens on
EXPOSE 3000

# Define the command to run your application
CMD [ "node", "server.js" ]