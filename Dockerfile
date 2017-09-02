FROM ruby:2.3.3

RUN mkdir /src && \
    mkdir /src/log /src/tmp && \
    touch /src/log/production.log
WORKDIR /src

# Optimisation: copy the Gemfiles and bundle install first to enable docker to use cached layers
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

COPY . /tmp/app
RUN chmod -R ug+rwx /tmp/app && \
    chown -R 1001:0 /tmp/app && \
    cp -rpT /tmp/app /src && \
    rm -rf /tmp/app && \
    RAILS_ENV=production rake assets:precompile

USER 1001
EXPOSE 8080
CMD bundle exec unicorn -p 8080 -c ./config/unicorn.rb
