FROM ruby:2.7.3-alpine

ARG WORKDIR

ENV RUNTIME_PACKAGES="linux-headers libxml2-dev make gcc libc-dev nodejs tzdata postgresql-dev postgresql git" \
  DEV_PACKAGES="build-base curl-dev" \
  HOME=/app \
  LANG=C.UTF-8 \
  TZ=Asia/Tokyo

RUN echo ${HOME}

WORKDIR ${HOME}

ADD Gemfile ${HOME}/Gemfile
ADD Gemfile.lock ${HOME}/Gemfile.lock

COPY Gemfile* ./

RUN apk update && \
  apk upgrade && \
  apk add --no-cache ${RUNTIME_PACKAGES} && \
  apk add --virtual build-dependencies --no-cache ${DEV_PACKAGES} && \
  bundle install -j4 && \
  apk del build-dependencies && \
  rm -rf ${HOME}/tmp/pids/server.pid

COPY . .

ADD . ${HOME}

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]