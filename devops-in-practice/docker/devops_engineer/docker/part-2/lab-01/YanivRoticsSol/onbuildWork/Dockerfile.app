# Use the previously built base image
FROM my-node-base

# The ONBUILD instructions defined in my-node-base will automatically execute here:
# 1. It will copy package.json to /app
# 2. Set WORKDIR to /app
# 3. Run npm install

# Now copy the rest of the application source code into /app
COPY . /app

# (Optional) Set the working directory explicitly (already set by ONBUILD, but can be re-affirmed)
WORKDIR /app

# Set the entry point to start your Node.js application
CMD ["node", "server.js"]