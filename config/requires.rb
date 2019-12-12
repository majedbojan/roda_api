# frozen_string_literal: true

module Requires
  require 'pry'
  require 'roda'
  require 'sequel'
  require 'bcrypt'
  require 'dotenv/load'
  require 'rack/protection'
  require './config/db'
end
