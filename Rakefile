# frozen_string_literal: true

require "bundler/gem_tasks"
require "minitest/test_task"

Minitest::TestTask.create

require "rubocop/rake_task"

RuboCop::RakeTask.new

require_relative "lib/cs133"

begin
  require "the_local/rake"
rescue LoadError
  # the_local not installed — build/install tasks unavailable.
end

task default: %i[test rubocop]
