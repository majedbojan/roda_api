# frozen_string_literal: true

begin
  require_relative '.env.rb'
rescue LoadError
end

require 'sequel/core'

module Config
  module DB
    def self.connect
      Sequel.connect(
        host:     '127.0.0.1',
        user:     ENV['PGUSER'],
        adapter:  'postgres',
        database: 'roda_api_development',
        password: ENV['PGPASSWORD']
      )
    end
  end
end
