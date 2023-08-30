class OrdersController < ApplicationController
  def create
    # raise
    @order = Order.new(order_params)
    @order.user = current_user
    @product = Product.find(params[:order][:product_id])
    @order.product = @product
    if @order.save
      # change to restaurant path, not root
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
    params.require(:order).permit(:comments)
  end
end
