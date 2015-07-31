#!/usr/bin/env rake

require 'bundler/setup'
require 'rubocop/rake_task'
require 'foodcritic'
require 'kitchen'

namespace :style do
  desc 'Run Ruby style checks'
  RuboCop::RakeTask.new

  desc 'Run Chef style checks'
  FoodCritic::Rake::LintTask.new
end

desc 'Run all style checks'
task style: ['style:foodcritic', 'style:rubocop']

# Integration tests. Kitchen.ci
namespace :integration do
  desc 'Run Test Kitchen'
  task :test do
    Kitchen.logger = Kitchen.default_file_logger
    Kitchen::Config.new.instances.each do |instance|
      instance.test(:always)
    end
  end

  desc 'Destroy all Test Kitchen nodes'
  task :destroy do
    Kitchen.logger = Kitchen.default_file_logger
    Kitchen::Config.new.instances.each(&:destroy)
  end
end

# Default
task default: ['style', 'integration:test']
