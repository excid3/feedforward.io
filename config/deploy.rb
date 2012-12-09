require "rvm/capistrano"
require 'bundler/capistrano'

set :application, "feedforward.io"

set :scm, :git
set :repository,  "git@github.com:excid3/feedforward.git"
set :default_environment, { 'PATH' => '/usr/local/rvm/gems/ruby-1.9.3-p125/bin:/usr/local/rvm/gems/ruby-1.9.3-p125@global/bin:/usr/local/rvm/rubies/ruby-1.9.3-p125/bin:/usr/local/rvm/bin:$PATH' }

set :location, "excid3.com"
role :web, location
role :app, location
role :db,  location, :primary => true

set :user, "root"
set :deploy_to, "/srv/www/#{application}"
set :rails_env, "production"

set :rvm_type, :system
set :rvm_bin_path, "/usr/local/rvm/bin"

# User local keys, not server keys
ssh_options[:forward_agent] = true
default_run_options[:pty] = true

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end

  desc "Symlink shared configs and folders on each release."
  task :symlink_shared do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end

  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

before 'deploy:finalize_update', 'deploy:symlink_shared'
