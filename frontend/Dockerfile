FROM node:16.5.0-alpine

ARG WORKDIR
# ARG CONTAINER_PORT
ARG API_URL

# ENV HOME=/${WORKDIR} \
ENV HOME=/app \
  LANG=C.UTF-8 \
  TZ=Asia/Tokyo \
  HOST=0.0.0.0 \
  # API_URL=${API_URL}
  API_URL=http://localhost:3000

RUN echo ${HOME}
# RUN echo ${CONTAINER_PORT}
RUN echo ${API_URL}

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