# config valid only for Capistrano 3.1
lock '3.4.1'

set :application, 'bottlelivesmatter'
set :repo_url, 'git@bitbucket.org:conicapps-team/bottle-lives-matter.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
# set :deploy_to, '/var/www/my_app'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, %w{config/database.yml config/secrets.yml .env.production}

# Default value for linked_dirs is []
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 3

namespace :deploy do
  task :upload_yml do
    on roles(:app) do
      execute "mkdir -p #{shared_path}/config"
      upload! StringIO.new(File.read(".env")), "#{shared_path}/.env.production"
      upload! StringIO.new(File.read("config/database.yml")), "#{shared_path}/config/database.yml"
      upload! StringIO.new(File.read("config/secrets.yml")), "#{shared_path}/config/secrets.yml"
    end
  end
end


namespace :unicorn do
  %w[start stop restart reload].each do |command|
    desc "#{command} unicorn"
    task command do
      on roles :app do
        execute "sudo service #{fetch(:unicorn_service)} #{command}"
      end
    end
  end
end
