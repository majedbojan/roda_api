# frozen_string_literal: true

class Category < Sequel::Model
  plugin :json_serializer
  one_to_many :items
end
