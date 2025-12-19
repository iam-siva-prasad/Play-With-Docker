
# Use a pinned, small image
FROM node:20-alpine

# Run in production mode
ENV NODE_ENV=production

# Set working directory
WORKDIR /usr/src/app

# ---- Dependencies (cache-friendly) ----
# Copy only manifest files first to leverage Docker layer caching
COPY package*.json ./

# Use npm ci if lockfile exists; omit dev deps for production
# NOTE: Alpine uses /bin/sh, so the shell 'if' is fine
RUN if [ -f package-lock.json ]; then npm ci --omit=dev; else npm install --omit=dev; fi

# ---- App source ----
COPY . .

# Ensure app files are owned by the non-root user
RUN addgroup -S app && adduser -S app -G app && chown -R app:app /usr/srcRUN addgroup -S app && adduser -S app -G app && chown -R app:app /usr/src/app
USER app

# Document container port (adjust to your app)
EXPOSE 3000

# Optional: Healthcheck (adjust path to your health endpoint)
# If you have /health or /, update accordingly
HEALTHCHECK --interval=30s --timeout=3s --start-period=10s --retries=3 \
  CMD wget -qO- http://localhost:3000/ || exit 1

# ---- Start command ----
# Option A: start with node
CMD ["node", "app.js"]

# Option B: start via npm script (uncomment if you have "start" in package.json)
