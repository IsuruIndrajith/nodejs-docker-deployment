FROM node:25-alpine3.21

COPY package.json /app/
COPY package-lock.json /app/
COPY index.js /app/

WORKDIR /app

RUN npm install

CMD ["node", "index.js"]