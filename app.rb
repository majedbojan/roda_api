# frozen_string_literal: true

require './config/requires.rb'

Config::DB.connect

class App < Roda
  plugin :hash_routes
  Sequel::Model.plugin :validation_helpers
  Sequel::Model.plugin :timestamps, update_on_create: true # To populate timestamps on record creation

  use Rack::Session::Cookie, secret: 'some_nice_long_random_string_DSKJH4378EYR7EGKUFH', key: '_roda_app_session'
  use Rack::Protection
  plugin :csrf

  plugin :head
  plugin :json, classes: [Array, Hash, Sequel::Model], content_type: 'application/json'

  require './app/models/importable.rb'
  Unreloader.require('app/controllers/api/v1') {}

  route do |r|
    r.root do
      { success: true, message: 'Application server is up', env: ENV['RACK_ENV'] }
    end
    r.hash_routes
  end
end
