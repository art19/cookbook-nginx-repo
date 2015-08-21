require 'foodcritic'
require 'kitchen'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

# Style tests. RuboCop and FoodCritic
namespace :style do
  desc 'Run Ruby style checks'
  RuboCop::RakeTask.new(:ruby)

  desc 'Run Chef style checks'
  FoodCritic::Rake::LintTask.new(:chef)
end

desc 'Run all style checks'
task style: ['style:chef', 'style:ruby']

# Unit tests.  RSpec and ChefSpec
namespace :unit do
  # RSpec and ChefSpec
  desc 'Run ChefSpec examples'
  RSpec::Core::RakeTask.new(:rspec)
end

# Integration tests. Kitchen.ci and Docker
namespace :integration do
  desc 'Run Test Kitchen with Vagrant'
  task :vagrant do
    Kitchen.logger = Kitchen.default_file_logger
    Kitchen::Config.new.instances.each do |instance|
      instance.test(:always)
    end
  end

  desc 'Run Test Kitchen with Docker'
  task :docker do
    Kitchen.logger = Kitchen.default_file_logger
    @loader = Kitchen::Loader::YAML.new(project_config: './.kitchen.docker.yml')
    config = Kitchen::Config.new(loader: @loader)
    config.instances.each do |instance|
      instance.test(:always)
    end
  end
end

desc 'Run all unit tests'
task unit: ['unit:rspec']

# Default
task default: %w(style unit)
