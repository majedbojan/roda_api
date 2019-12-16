# frozen_string_literal: true

class App
  hash_branch('items') do |r|
    r.get do
      { message: 'Data found', data: { items: Item.all } }
    end

    r.post do
      @item = Item.create(item_params(r))
      { message: 'Item Created successfully', data: { item: @item } }
    end

    r.is 'item', Integer do |user_id|
      # item/:id used to match get, put and delete request, to provide
      # getting item by id, updating and deleting item
      @item = Item[user_id]
      # use halt to return 404 without evaluating rest of the block
      r.halt(404) unless @item

      r.get do
        { message: 'Data found', data: { item: @item } }
      end

      r.put do
        @item.update(item_params(r))

        { message: 'Item Updated successfully', data: { item: @item } }
      end

      r.delete do
        @item.destroy
        response.status = 204
        { message: 'Item Deleted successfully', data: { user_id: user_id } }
      end
    end
  end

  private

  def item_params(r)
    prms = r.params
    {
      name:        prms['name'],
      category_id: prms['category_id'],
      price:       prms['price'],
      currency:    prms['currency'],
      color:       prms['color']
    }
  end
end
