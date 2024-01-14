# Builds production image
FROM 111109246567.dkr.ecr.us-west-2.amazonaws.com/node-base:8

# Install curl, necessary for codecov upload
RUN apt-get -y update && \
  apt-get -y install curl python-pip && \
  pip install coverage

# Install yarn
RUN npm i -g yarn

# Switch to directory with sources
WORKDIR /project

# Map root dependencies
COPY package.json yarn.lock .npmrc codecov.yml ./

# Setup Node environment
ARG NPM_TOKEN
ARG NODE_ENV
ENV NODE_ENV=${NODE_ENV}

# Install root dependencies
RUN yarn --silent --frozen-lockfile

# Copy the rest of the project
COPY . .

# Create a build of the project
RUN yarn build
