FROM ruby:2.3.3

WORKDIR /usr/src/app

# Optimisation: copy the Gemfiles and bundle install first to enable docker to use cached layers
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

COPY . /tmp/app
RUN cd /tmp/app && RAILS_ENV=production rake assets:precompile && \
    chmod -R ug+rwx /tmp/app && \
    chown -R 1001:0 /tmp/app && \
    cp -rpT /tmp/app /usr/src/app && \
    rm -rf /tmp/app

USER 1001
EXPOSE 8080
CMD bundle exec unicorn -p 8080 -c ./config/unicorn.rb
