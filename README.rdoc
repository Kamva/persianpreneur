==Development evnironment

gem install foreman
bundle install
echo "RACK_ENV=development" >> .env
echo "PORT=3000" >> .env
rake db:create db:migrate
foreman start
