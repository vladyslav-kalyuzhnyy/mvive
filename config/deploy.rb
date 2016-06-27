# config valid only for current version of Capistrano
lock '3.5.0'

set :repo_url, 'https://github.com/vladyslav-kalyuzhnyy/mvive.git'
set :scm, :git
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

set :user, 'deployer'
set :application, 'M-Vive'
set :rails_env, 'production'
server '52.38.97.207', user: "#{fetch(:user)}", roles: %w{app db web}, primary: true
set :deploy_to,       "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :pty, true
set :deploy_via, :remote_cache
set :linked_files, %w{config/database.yml}
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml', 'config/puma.rb')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :rvm_type, :user                     # Defaults to: :auto
set :rvm_ruby_version, '2.3.0'      # Defaults to: 'default'
set :rvm_roles, [:app, :web]

set :config_files, %w{config/database.yml config/secrets.yml}
set :puma_conf, "#{shared_path}/config/puma.rb"

namespace :git do
  desc 'Deploy'
  task :deploy do
    ask(:message, "Commit message?")
    run_locally do
      execute "git add -A"
      execute "git commit -m '#{fetch(:message)}'"
      execute "git push"
    end
  end
end

namespace :deploy do
  before 'check:linked_files', 'config:push'
  before 'check:linked_files', 'puma:config'
  before 'check:linked_files', 'puma:nginx_config'
  before 'deploy:migrate', 'deploy:db:create'
  after 'puma:smart_restart', 'nginx:restart'
end
