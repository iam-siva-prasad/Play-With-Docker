
# Use a pinned, small image
FROM node:20-alpine

# Run in production mode
ENV NODE_ENV=production

# Set working directory
WORKDIR /usr/src/app

# ---- Dependencies (cache-friendly) ----
# Copy only manifest files first to leverage Docker layer caching
COPY package*.json ./

# Use npm ci if lockfile exists; omit dev deps for production# Use npm ci if lockfile exists; omit dev deps for production
# NOTE: Alpine uses /bin/sh, so the shell 'if' is fine
RUN if [ -f package-lock.json ]; then npm ci --omit=dev; else npm install --omit=dev; fi

# ---- App source ----
COPY . .

# Document container port (adjust to your app)
EXPOSE 3000

# Create and switch to non-root user for security
RUN addgroup -S app && adduser -S app -G app
USER app

# ---- Start command ----
# Option A: start with node
CMD ["node", "app.js"]

# Option B: start via npm script (recommended if you use scripts)
