require 'bundler/capistrano' # for bundler support

set :application, "chess-ladder"
set :repository,  "git@github.com:mecampbellsoup/chess-ladder.git"

set :user, 'deploy'
set :deploy_to, "/home/#{ user }/#{ application }"
set :use_sudo, false

set :scm, :git

default_run_options[:pty] = true

set :server_ip, '162.243.77.171'                   # This should be your server's IP
role :web, "#{server_ip}"                          # Your HTTP server, Apache/etc
role :app, "#{server_ip}"                          # This may be the same as your `Web` server
role :db,  "#{server_ip}", :primary => true        # This is where Rails migration will run

# if you want to clean up old releases on each deploy uncomment this:
before "deploy:restart", "deploy:symlink_database"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :symlink_database, :roles => :app do
    run "ln -nfs #{shared_path}/production.sqlite3 #{current_path}/db/production.sqlite3"
  end

  task :migrate, :roles => :app do
    run "cd #{current_path} && rake db:migrate RAILS_ENV=production"
  end

  task :start do; end
  task :stop do; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

end