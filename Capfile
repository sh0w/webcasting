# Load DSL and Setup Up Stages
require 'capistrano/setup'

# Includes default deployment tasks
require 'capistrano/deploy'

#
 require 'capistrano/rvm'
 set :rvm_type, :local_user
 set :rvm_ruby_version, '1.9.3p484'
# require 'capistrano/rbenv'
# require 'capistrano/chruby'
 require 'capistrano/bundler'
 require 'capistrano/rails'
# require 'capistrano/rails/assets'
# require 'capistrano/rails/migrations'

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
