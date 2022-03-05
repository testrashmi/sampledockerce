# syntax=docker/dockerfile:1
#FROM node:12-alpine

FROM icr.io/codeengine/golang:alpine
RUN apk add --no-cache python2 g++ make
WORKDIR /app
COPY . .
RUN apk add yarn && yarn install
RUN yarn install --production
CMD ["node", "src/index.js"]
EXPOSE 3000


