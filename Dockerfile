FROM ruby:latest

USER root

RUN mkdir src
WORKDIR src
COPY . .

RUN bundle install
RUN mkdir -p log
RUN touch log/production.log
RUN chmod 664 log/production.log
RUN RAILS_ENV=production rake assets:precompile

EXPOSE 8080
CMD bundle exec unicorn -p 8080 -c ./config/unicorn.rb
