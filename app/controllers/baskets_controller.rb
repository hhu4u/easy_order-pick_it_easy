class BasketsController < ApplicationController
  def show
    @basket = Basket.find(params[:id])
    @orders = Order.where(basket: @basket)
  end
end
