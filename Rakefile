# frozen_string_literal: true

Dir.glob('lib/tasks/*.rake').each { |r| import r }

require 'rubocop/rake_task'
RuboCop::RakeTask.new

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

task default: %i[spec rubocop]
