FROM node:lts-alpine

WORKDIR /opt/love-js

RUN apk add --no-cache --virtual .build-deps git \ 
    && git clone --depth 1 https://github.com/Davidobot/love.js  \
    && rm -rf love.js/.git \
    && rm -rf love.js/spec \
    && apk del .build-deps
RUN cd love.js && npm install && npm link && cd ..
