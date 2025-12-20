
# Use a small, pinned Node image
FROM node:20-alpine

# Run in production mode
ENV NODE_ENV=production

# Set working directory
WORKDIR /usr/src/app

# Copy only package manifest first to leverage Docker layer caching
COPY package*.json ./

# Install production dependencies
RUN npm ci --only=production || npm install --only=production

# Copy the rest of the application source
COPY . .

# Optionally drop privileges (Node image has a 'node' user)
USER node

# Expose the app port (adjust if your app listens on a different port)
EXPOSE 3000

# Start the application
CMD ["node", "app.js"]
