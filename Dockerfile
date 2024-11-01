# Use an official Node.js runtime as the base image
FROM node:14-alpine

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the entire project to the working directory
COPY . .

# Set the environment variable for production
ENV NODE_ENV=production

# Expose the desired port (e.g., 3000)
EXPOSE 81

# Start the Node.js server
CMD ["node", "server.js"]