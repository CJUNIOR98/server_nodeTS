FROM node:18-alpine

RUN npm install -g ts-node

WORKDIR /usr/src/app

COPY package*.json ./

COPY . .

RUN npm install

ENV NODE_ENV=production

RUN npm run m:gen -- src/migrations/InitDB

RUN npm run m:run

EXPOSE 4000

CMD [ "npm", "start" ]