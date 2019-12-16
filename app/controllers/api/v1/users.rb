# frozen_string_literal: true

class App
  hash_branch('users') do |r|
    r.get do
      page = r.params[:page] || 1
      { message: 'Data found', data: { users: User.paginate(page, 10).map(&:to_json) } }
    end

    r.post do
      @user = User.create(user_params(r))
      { message: 'User Created successfully', data: { user: @user } }
    end

    r.is 'user', Integer do |user_id|
      # user/:id used to match get, put and delete request, to provide
      # getting user by id, updating and deleting user
      @user = User[user_id]
      # use halt to return 404 without evaluating rest of the block
      r.halt(404) unless @user

      r.get do
        { message: 'Data found', data: { user: @user } }
      end

      r.put do
        @user.update(user_params(r))
        { message: 'User Updated successfully', data: { user: @user } }
      end

      r.delete do
        @user.destroy
        response.status = 204
        { message: 'User Deleted successfully', data: { user_id: user_id } }
      end
    end
  end

  private

  def user_params(r)
    { name: r.params['name'], email: r.params['email'], password_hash: r.params['password'] }
  end
end
