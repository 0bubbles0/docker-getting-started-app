# syntax=docker/dockerfile:1
# That was a parser directive

# Now optional global ARGs for the FROM lines: 
# ARG something 

# Set Parent Image (docker may need to download required layers):
FROM node:18-alpine

# Set/Make working directory for subsequent RUN, CMD, ENTRYPOINT, COPY, ADD:
WORKDIR /app

# Copy new files from source . to WORKDIR container-filesystem:
## COPY . . ## This is the default, but we want to cache image layers, so will split:
COPY package.json yarn.lock ./

# Install project dependencies:
RUN yarn install --production

COPY . .

# Default command to run when starting a container from this image (previous CMDs will be ignored). Flags as their own "":
CMD ["node", "src/index.js"]

# Port:
EXPOSE 3000