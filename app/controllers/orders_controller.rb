class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @product = Product.find(params[:product_id])
    @order.product = @product
    current_basket = Basket.where(user: current_user, basket_status: "New").first
    @order.basket = current_basket

    if @order.save
      # change to restaurant path, not root
      # redirect_to restaurant_products_path
    else
      render "products/show", status: :unprocessable_entity
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def order_params
    params.require(:order).permit(:comments)
  end
end
