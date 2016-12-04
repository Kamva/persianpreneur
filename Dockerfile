FROM ruby:latest

RUN mkdir /src && \
    mkdir /src/log /src/tmp && \
    touch /src/log/production.log
WORKDIR /src

# Optimisation: copy the Gemfiles and bundle install first to enable docker to use cached layers
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

COPY . .
RUN RAILS_ENV=production rake assets:precompile

RUN chmod -R g+rw /src
USER 1001

EXPOSE 8080
CMD bundle exec unicorn -p 8080 -c ./config/unicorn.rb
