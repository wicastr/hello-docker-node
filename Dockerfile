FROM wicastr/node:latest-onbuild

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ARG NODE_ENV=production
ENV NODE_ENV $NODE_ENV
ARG NODE_PORT=3000
ENV NODE_PORT $NODE_PORT

COPY package.json ./
RUN npm install --${NODE_ENV} && npm cache clean --force

COPY . .

EXPOSE ${NODE_PORT}

CMD [ "npm", "start" ]
