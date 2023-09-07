class ProductsController < ApplicationController
  def index
    @products = Product.where(restaurant_id: params[:restaurant_id])
  end

  def show
    @product = Product.find(params[:id])
    @restaurant = Restaurant.find(params[:restaurant_id])
    @order = Order.new
    @number_of_reviews = @product.reviews.count
    sum = 0
    if @number_of_reviews > 0
      @product.reviews.each do |review|
        sum += review.rating
      end
      @score = sum / @number_of_reviews
    end
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @product = Product.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @product = Product.new(product_params)
    @product.restaurant = @restaurant
    if @product.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:restaurant_id])
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to restaurant_product_path(@product.restaurant, @product)
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to restaurant_path(@product.restaurant), status: :see_other
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :ingredients, :photo, :thumbnail, :dish_type, :available)
  end
end
