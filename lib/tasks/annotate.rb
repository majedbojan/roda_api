# frozen_string_literal: true

desc 'Update model annotations'
task :annotate do
  # Load the models first
  Dir['models/*.rb'].each { |f| require_relative f }

  require 'sequel/annotate'
  Sequel::Annotate.annotate(Dir['models/*.rb'])
end
