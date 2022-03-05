# syntax=docker/dockerfile:1
#FROM node:12-alpine

FROM icr.io/codeengine/golang:alpine
RUN apk add --no-cache python2 g++ make
WORKDIR /app
COPY . .
RUN npm --verbose install
RUN npm run build
RUN npm i -g yarn
RUN yarn install --production
CMD ["node", "src/index.js"]
EXPOSE 3000


