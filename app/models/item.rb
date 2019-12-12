# frozen_string_literal: true

class Item < Sequel::Model
  plugin :json_serializer
  one_to_many :orders
  many_to_one :category
end
