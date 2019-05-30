require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rvm'
require 'yaml'
require 'io/console'

%w[base check log_rotate mysql nginx].each do |pkg|
  require "#{File.join(__dir__,'deploy','recipes', pkg)}"
end

set :application, 'glg'
set :user, 'deploy'
set :deploy_to, "/home/#{fetch(:user)}/#{fetch(:application)}"
set :repository, repository_url
set :branch, set_branch
set :rvm_use_path, "/home/#{fetch(:user)}/.rvm/scripts/rvm"
set :ruby_version, "#{File.readlines(File.join(__dir__, '..', '.ruby-version')).first.strip}"
set :gemset, "#{File.readlines(File.join(__dir__, '..', '.ruby-gemset')).first.strip}"
set :shared_dirs, fetch(:shared_dirs, []).push('tmp', 'storage')
set :shared_files, fetch(:shared_file, []).push(
    'config/database.yml',
    'config/storage.yml',
    'config/master.key'
)
set :term_mode, :nil
set :ubuntu_code_name, 'bionic'

task :remote_environment do
  set :rails_env, ENV['on'].to_sym unless ENV['on'].nil?
  require "#{File.join(__dir__, 'deploy', "#{fetch(:rails_env)}_configurations_files", "#{fetch(:rails_env)}.rb")}"
  invoke :'rvm:use', "ruby-#{fetch(:ruby_version)}@#{fetch(:gemset)}"
end

task setup_yml: :remote_environment do
  Dir[File.join(__dir__, '*.yml.example')].each do |_path|
    command %[echo "#{IO.binread(_path)}" > "#{File.join(fetch(:deploy_to), 'shared/config', File.basename(_path, '.yml.example') +'.yml')}"]
  end
end

task set_sudo_password: :remote_environment do
  set :sudo_password, ask_sudo
  command "echo '#{IO.binread(File.join(__dir__, 'deploy', "#{fetch(:rails_env)}_configurations_files", 'sudo_password.erb'))}' > /home/#{fetch(:user)}/SudoPass.sh"
  command "chmod +x /home/#{fetch(:user)}/SudoPass.sh"
  command "export SUDO_ASKPASS=/home/#{fetch(:user)}/SudoPass.sh"
end

desc 'Restart passenger server'
task :restart => :remote_environment do
  # invoke :set_sudo_password
  invoke :'crontab:install'
  command %[sudo -A service nginx restart]
  command %[mkdir -p #{File.join(fetch(:current_path), 'tmp')}]
  command %[touch #{File.join(fetch(:current_path), 'tmp', 'restart.txt')}]
end

desc 'Deploys the current version to the server.'
task :deploy => :remote_environment do
  deploy do
    invoke :'check:revision'
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'mysql:create_database'
    invoke :'mysql:migrate_database'
    invoke :'rails:assets_precompile'
  end
  on :launch do
  end
  invoke :restart
end

