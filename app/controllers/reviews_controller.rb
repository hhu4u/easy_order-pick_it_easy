class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @order = Order.find(params[:order_id])
    @review.order = @order
    if @review.save
      redirect_to basket_orders_path(@order.basket)
    else
      flash[:alert] = "Something went wrong."
      render ''
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating)
  end
end
