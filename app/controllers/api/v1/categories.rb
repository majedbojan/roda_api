# frozen_string_literal: true

class App
  hash_branch('categories') do |r|
    r.get do
      { message: 'Data found', data: { categories: Category.all } }
    end

    r.post do
      @category = Category.create(category_params(r))
      { message: 'Category Created successfully', data: { category: @category } }
    end

    r.is 'category', Integer do |user_id|
      # category/:id used to match get, put and delete request, to provide
      # getting category by id, updating and deleting category
      @category = Category[user_id]
      # use halt to return 404 without evaluating rest of the block
      r.halt(404) unless @category

      r.get do
        { message: 'Data found', data: { category: @category } }
      end

      r.put do
        @category.update(category_params(r))

        { message: 'Category Updated successfully', data: { category: @category } }
      end

      r.delete do
        @category.destroy
        response.status = 204
        { message: 'Category Deleted successfully', data: { user_id: user_id } }
      end
    end
  end

  private

  def category_params(r)
    { name: r.params['name'] }
  end
end
