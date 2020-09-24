#!/usr/bin/env rake

require 'cookstyle'
require 'rubocop/rake_task'
require 'rspec/core/rake_task'

desc 'Run all lints'
task lint: %i(cookstyle spec)
task default: :lint

desc 'Run Rubocop (Cookstyle) Linting'
RuboCop::RakeTask.new(:cookstyle) do |task|
  task.options << '--display-cop-names'
end

desc 'Run Knife Cookbook Tests'
task :knife do
  current_dir = File.expand_path(File.dirname(__FILE__))
  cookbook_dir = File.dirname(current_dir)
  cookbook_name = File.basename(current_dir)
  sh "bundle exec knife cookbook test -o #{cookbook_dir} #{cookbook_name}"
end

desc 'Run ChefSpec Unit Tests'
RSpec::Core::RakeTask.new(:spec)

desc 'Run Test-Kitchen Integration Tests'
task :kitchen do
  begin
    require 'kitchen/rake_tasks'
    Kitchen::RakeTasks.new
  rescue LoadError
    puts '>>>>> Kitchen gem not loaded, omitting tasks' unless ENV['CI']
  end
end
