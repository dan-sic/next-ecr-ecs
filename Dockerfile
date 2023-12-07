
# Use the official Node.js image as the base image
FROM node:20-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package.json ./
COPY yarn.lock ./

# Install dependencies
RUN yarn install

# Copy the entire project to the working directory
COPY . .

# Build the Next.js app
RUN yarn build

USER node

# Expose the port on which the app will run
EXPOSE 3000

# Start the app
CMD ["yarn", "start"]
