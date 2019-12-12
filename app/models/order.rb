# frozen_string_literal: true

class Order < Sequel::Model
  plugin :json_serializer
  many_to_one :item
  many_to_one :user
end
