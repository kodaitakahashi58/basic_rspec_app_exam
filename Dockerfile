FROM ruby:3.1.4
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo
RUN apt-get update -qq \
  && apt-get install -y curl \
  && curl -fsSL https://deb.nodesource.com/setup_22.x | bash - \
  && apt-get update -qq \
  && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /rspec_app_exam
WORKDIR /rspec_app_exam
RUN gem install bundler:2.3.17
COPY Gemfile /rspec_app_exam/Gemfile
COPY Gemfile.lock /rspec_app_exam/Gemfile.lock
RUN bundle install
COPY . /rspec_app_exam