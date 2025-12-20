
# Use a small, pinned Node image
FROM node:20-alpine

# Run in production mode
ENV NODE_ENV=production
# Default port (change if needed)
ENV PORT=3000

# Create app directory
WORKDIR /usr/src/app

# Copy only package manifests first to leverage Docker layer caching
COPY package*.json ./

# Install production dependencies (prefer lockfile; fallback to install)
RUN npm ci --only=production || npm install --only=production

# Copy the rest of the application source
COPY . .

# Optional: ensure the runtime user is non-root (provided by Node image)
USER node

# Document the port (not required for binding, but useful metadata)
EXPOSE 3000

# Simple healthcheck hitting the container-local port
# If you have /healthz route, prefer that.
HEALTHCHECK --interval=5s --timeout=3s --retries=10 \
  CMD wget -qO- http://localhost:${PORT}/ || exit 1

# Start the application
# If your main file is different, change app.js accordingly.
CMD ["node", "app.js"]
