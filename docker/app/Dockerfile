# vim:set ft=dockerfile:
# 
# WEBAPP
#
FROM ruby:2.7.3

LABEL com.jogoj.service.name="app" \
      com.jogoj.type="app" \
      version="0.1" \
      description=""

ENV LANG C.UTF-8
ENV TZ Asia/Tokyo
ENV APP_HOME=/var/www/app

SHELL ["/bin/bash", "-lc"]

COPY docker-entrypoint.sh /
RUN chmod 755 /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

WORKDIR ${APP_HOME}

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    cmake \
    nodejs
RUN apt-get update && apt-get install -y yarn

RUN gem install bundler:2.2

# Install supervisord
RUN apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 3000/tcp

# https://github.com/docker/compose/issues/1393
CMD rm -f tmp/pids/server.pid && /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
