# Load DSL and Setup Up Stages
require 'capistrano/setup'

# Includes default deployment tasks
require 'capistrano/deploy'
require 'capistrano/rails'
require 'capistrano/bundler'

#
 require 'capistrano/rvm'
 set :rvm_type, :user
 set :rvm_ruby_version, '1.9.3-p551'
# require 'capistrano/rbenv'
# require 'capistrano/chruby'

# require 'capistrano/rails/assets'
# require 'capistrano/rails/migrations'

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
