class BasketsController < ApplicationController
  def show
    @basket = Basket.find(params[:id])
    @table = @basket.table
    @restaurant = @table.restaurant
    @orders = Order.where(basket: @basket)
  end

  def index
    @baskets = Basket.where(user: current_user)
  end

  def confirm_basket

    @basket = Basket.find(params[:id])
    @table = @basket.table
    @restaurant = @table.restaurant
    @orders = Order.where(basket: @basket)
    basket_total = 0
    @orders.each do |order|
      basket_total += order.product.price
    end
    @basket.update!(total_price: basket_total, payment_status: 'pending', user: current_user)

      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [
          quantity: 1,
          price_data: {
            unit_amount: @basket.total_price.to_i * 100,
            # raise
            # unit_amount: 3000.00,
            currency: 'eur',
            product_data: {
              name: "#{@restaurant.name} - Table #{@table.number}"
            }
          }
        ],
        mode: "payment",
        success_url: restaurant_table_basket_url(@restaurant, @table, @basket),
        cancel_url: restaurant_table_basket_url(@restaurant, @table, @basket)
      )

    @basket.update(checkout_session_id: session.id)
    redirect_to controller: "pages", action: "loading", basket: @basket # path to check
  end
end
