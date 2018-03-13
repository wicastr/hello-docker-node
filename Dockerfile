FROM wicastr/node:8.10.0

WORKDIR /usr/src/app

ENV NODE_PORT 3000

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE $NODE_PORT

CMD [ "npm", "start" ]
