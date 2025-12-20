# Test web app that returns the name of the host/pod/container servicing req
# Linux x64
FROM node:current-alpine

# Use a pinned, small image
FROM node:20-alpine

# Run in production mode
ENV NODE_ENV=production

# Set working directory
WORKDIR /usr/src/app

# Install dependencies from packages.json
RUN npm install

# Command for container to execute
ENTRYPOINT [ "node", "app.js" ]