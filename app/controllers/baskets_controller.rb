class BasketsController < ApplicationController
  def show
    @basket = Basket.find(params[:id])
    @table = @basket.table
    @restaurant = @table.restaurant
    @orders = Order.where(basket: @basket)
  end
end
