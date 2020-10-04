# frozen_string_literal: true

class App
  hash_branch('orders') do |r|
    r.get do
      { message: 'Data found', data: { orders: Order.all } }
    end

    r.post do
      @order = Order.create(order_params(r))
      { message: 'Order Created successfully', data: { order: @order } }
    end

    r.is 'order', Integer do |user_id|
      # order/:id used to match get, put and delete request, to provide
      # getting order by id, updating and deleting order
      @order = Order[user_id]
      # use halt to return 404 without evaluating rest of the block
      r.halt(404) unless @order

      r.get do
        { message: 'Data found', data: { order: @order } }
      end

      r.put do
        @order.update(order_params(r))

        { message: 'Order Updated successfully', data: { order: @order } }
      end

      r.delete do
        @order.destroy
        response.status = 204
        { message: 'Order Deleted successfully', data: { user_id: user_id } }
      end
    end
  end

  private
    def order_params(r)
      prms = r.params
      {
        name:    prms['name'],
        user_id: prms['user_id'],
        item_id: prms['item_id'],
        address: prms['address']
      }
    end
end
