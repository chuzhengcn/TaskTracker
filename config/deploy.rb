set :application, "TaskTracker"
set :repository,  "git@192.168.10.102:TaskTracker.git"

set :branch, "master"
set :user, "syyx"
set :port, "22"

set :deploy_to, "/home/syyx/sites/TaskTracker/"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "192.168.10.102"                          # Your HTTP server, Apache/etc
role :app, "192.168.10.102"                          # This may be the same as your `Web` server
role :db,  "192.168.10.102", :primary => true # This is where Rails migrations will run
role :db,  "192.168.10.102"

namespace :deploy do

  task :copy_config_files, :roles => [:app] do
    db_config = "#{shared_path}/database.yml"
    run "cp #{db_config} #{release_path}/config/database.yml"
  end
  
  task :update_symlink do
    run "ln -s {shared_path}/public/system {current_path}/public/system"
  end
  
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

#  如果將database.yml放在shared下，請打開
 after "deploy:update_code", "deploy:copy_config_files" 

# 如果有實作使用者上傳檔案到public/system，請打開
 after "deploy:finalize_update", "deploy:update_symlink" 

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
