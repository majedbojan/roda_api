# frozen_string_literal: true

require 'pry'
class User < Sequel::Model
  attr_accessor :password # , :password_confirmation

  plugin :json_serializer
  one_to_many :orders

  # def validate
  #   super
  #   # binding.pry
  #   validates_presence :password
  #   validates_length_range 4..40, :password
  # end

  def before_save
    super
    encrypt_password
  end

  def self.paginate(page_no, page_size)
    ds = Config::DB.connect[:users]
    ds.extension(:pagination).paginate(page_no, page_size)
  end

  private
    def encrypt_password
      self.password_hash = BCrypt::Password.create(password)
    end
end
