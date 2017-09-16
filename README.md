[![Codacy Badge](https://www.codacy.com/project/badge/6d272da20346454084daca2f37381349)](https://www.codacy.com)
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

You can import a list of people by `rake db:person:import` You can also wipe off the database of 'persons' by `rake db:person:clear` 

You can add admin via `rails console`. 

```Ruby
irb(main):015:0> a=Admin.new(email: 'jon@gmail.com', password: 'asecretpass')
irb(main):016:0> a.save!
```

## Deploy on Heroku

You need to remove `therubyracer` and `execjs` gems. Heroku doesn't need a js runtime.

## Deploy on AbarCloud

Follow the [quick start guide](https://en-docs.abarcloud.com/quickstart.html) to deploy it. You can also [add a custom domain with SSL](https://en-docs.abarcloud.com/deployment/custom-domain-names.html).

## Deploy on Heroku

You need to remove `therubyracer` and `execjs` gems. Heroku doesn't need a js runtime.

## Deploy elsewhere
Alternatively, you can use nodejs instead of `execjs`. It's was just more convenient to add a gem rather than asking all to install nodejs.
Follow [this guide!](https://gorails.com/deploy/ubuntu/14.04)
