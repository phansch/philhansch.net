FROM ruby:2.1.6
MAINTAINER Philipp Hansch <dev@phansch.net>

RUN apt-get update -qq && apt-get install -y \
    nginx \
    npm \
    nodejs-legacy
RUN npm install -g phantomjs

WORKDIR /tmp
COPY Gemfile /tmp/Gemfile

RUN bundle install
COPY . /code
RUN jekyll build -s /code -d /var/www/html

ENTRYPOINT ["service", "nginx", "start"]

RUN echo "daemon off;" >>/etc/nginx/nginx.conf

EXPOSE 80
