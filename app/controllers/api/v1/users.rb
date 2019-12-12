# frozen_string_literal: true

class App
  hash_branch 'users' do |r|
    r.get do
      @users = User.all
      @users.map(&:to_json)
      # { message: 'This should return users list', env: ENV['RACK_ENV'] }
    end
  end
end
