FROM node:16.5.0-alpine

ARG WORKDIR
# ARG CONTAINER_PORT
ARG API_URL
ARG DOMAIN

# ENV HOME=/${WORKDIR} \
ENV HOME=/app \
  LANG=C.UTF-8 \
  TZ=Asia/Tokyo \
  HOST=0.0.0.0

WORKDIR ${HOME}

# local実行時はコメントアウト
ADD package.json /app/package.json
ADD yarn.lock /app/yarn.lock

RUN yarn install

ADD . /app

# local実行時はコメントアウト
RUN yarn build

# EXPOSE ${CONTAINER_PORT}
EXPOSE 8080

# local実行時はコメントアウト
CMD ["yarn", "start"]