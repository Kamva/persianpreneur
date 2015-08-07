# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'Persianpreneur'
set :repo_url, 'git@github.com:hadifarnoud/persianpreneur.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/home/deploy/persianpreneur'
set :deploy_user, "deploy"
set :linked_files, %w{config/database.yml .env config/secrets.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/assets/images}
# https://github.com/capistrano/bundler/issues/45
set :bundle_binstubs, nil

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  # after :publishing, :restart
  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
