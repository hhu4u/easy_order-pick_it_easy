class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)
    @user = User.find(params[:user_id])
    @order.user = @user
    @product = Product.find(params[:product_id])
    @order.product = @product
    if @order.save
      redirect_to root_path
    else
      render :show, status: :unprocessable_entity
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def order_params
    params.require(:order).permit(:comment)
  end
end
