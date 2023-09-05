class OrdersController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @order = Order.new(order_params)
    @order.user = current_user
    @product = Product.find(params[:product_id])
    @order.product = @product
    @order.basket = Basket.where(user: current_user, basket_status: "New").first
    if @order.save
      redirect_to restaurant_path(@restaurant)
    else
      render "products/show", status: :unprocessable_entity
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])
    @order = Order.find(params[:id])
    @product = @order.product
  end

  def update
    @order = Order.find(params[:id])
    @product = @order.product
    @basket = @order.basket
    @table = @order.basket.table
    if @order.update(order_params)
      redirect_to restaurant_table_basket_path(@order.basket.table.restaurant, @order.basket.table,@order.basket)
    else

    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to restaurant_table_basket_path(@order.basket.table.restaurant, @order.basket.table,@order.basket), status: :see_other
  end

  private

  def order_params
    params.require(:order).permit(:comments)
  end
end
