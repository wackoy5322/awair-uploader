FROM node:14-alpine

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY *.json ./
COPY src/ ./src

RUN apk update --no-cache && apk add gcc g++ make python3

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production
RUN npm run prepare
# Bundle app source
COPY . .

EXPOSE 8080
CMD [ "npm", "run", "serve" ]
