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
Login to https://dashboard.abarcloud.com/console/command-line to download the CLI.

Get your CLI login token from https://dashboard.abarcloud.com/console/command-line

Login to CLI:
`oc login https://dashboard.abarcloud.com --token=<my_token>`

Create a new project:
`oc new-project my-new-project`

Create the app, using Docker:
`oc new-app --strategy=docker https://github.com/KamvaHQ/persianpreneur.git`

Patch the build configuration so it doesn't use any base images, and creates a new image from scratch:
`oc patch bc/persianpreneur -p '{"spec":{"strategy":{"dockerStrategy":null}}}'`

Stop the old build, and start a new build as we changed the build config above:
`oc cancel-build persianpreneur-1`
`oc start-build persianpreneur`

Create a route so the service is exposed externally:
`oc expose svc/persianpreneur`

If you want HTTPS:
`oc patch route/persianpreneur -p '{"spec":{"tls":{"termination":"edge","insecureEdgeTerminationPolicy":"Redirect"}}}'`

Show the route URL:
`oc get routes`

Get the build logs, once it's finished, it'll trigger a deployment and you can browse to the route:
`oc logs -f bc/persianpreneur`

## Deploy elsewhere
Alternatively, you can use nodejs instead of `execjs`. It's was just more convenient to add a gem rather than asking all to install nodejs.
Follow [this guide!](https://gorails.com/deploy/ubuntu/14.04)
