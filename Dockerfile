FROM wicastr/node:8.10.0

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ENV NODE_PORT 3000
ENV NODE_ENV production

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE $NODE_PORT

CMD [ "npm", "start" ]
