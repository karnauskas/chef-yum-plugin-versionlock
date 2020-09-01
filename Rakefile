#!/usr/bin/env rake

require 'rspec/core/rake_task'

desc 'Run all lints'
task lint: %w(spec)
task default: lint:

desc 'Run Chef Spec Test'
task :spec do
  RSpec::Core::RakeTask.new(:spec)
end

desc 'Run Test-Kitchen Integration Tests'
task :kitchen do
  begin
    require 'kitchen/rake_tasks'
    Kitchen::RakeTasks.new
  rescue LoadError
    puts '>>>>> Kitchen gem not loaded, omitting tasks' unless ENV['CI']
  end
end
