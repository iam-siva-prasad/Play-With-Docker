
FROM node:20-alpine

ENV NODE_ENV=production
WORKDIR /usr/src/app

# Copy only package manifests first for better caching
COPY package*.json ./
RUN if [ -f package-lock.json ]; then npm ci --omit=dev; else npm install --omit=dev; fi

# Copy app source
COPY . .

# Optional, if you know the port
EXPOSE 3000

# Security: non-root user
RUN addgroup -S app && adduser -S app -G app
USERUSER app

# Start app (CMD is flexible)
