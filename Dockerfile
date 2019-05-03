FROM node:10-alpine

WORKDIR /code

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 1337

USER node

CMD ["npm", "start"]
