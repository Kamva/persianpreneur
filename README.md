#What is Persianpreneur?

It's a list of awesome Persian entrepreneurs doing great work around the world. It's inspired by Beggars.co idea. We didn't know PHP so we rewrote the whole thing in Ruby on Rails.

## Development evnironment
```Ruby
gem install foreman
bundle install
echo "RACK_ENV=development" >> .env
echo "PORT=3000" >> .env
rake db:create db:migrate
foreman start
```

## Tasks

You can import a list of people by `rake import` You can also wipe off the database of 'persons' by `rake db:clear_person`

## Deploy on Heroku

You need to remove `therubyracer` and `execjs` gems. Heroku doesn't need a js runtime. Alternatively, you can use nodejs instead of 'execjs'. It's was just more convenient to add a gem rather than asking all to install nodejs.

## Deploy elsewhere

Follow [this guide!](https://gorails.com/deploy/ubuntu/14.04)
