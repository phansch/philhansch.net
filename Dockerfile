FROM ruby:2.1.6

RUN apt-get update -qq && apt-get install -y npm nodejs-legacy
RUN npm install -g phantomjs

ADD . /code
WORKDIR /code

COPY Gemfile /code/Gemfile

RUN bundle install
