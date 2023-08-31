class ProductsController < ApplicationController
  def index
    @products = Product.where(restaurant_id: params[:restaurant_id])
  end

  def show
    @product = Product.find(params[:id])
    @restaurant = Restaurant.find(params[:restaurant_id])
    @order = Order.new
  end

  def new
    @product = Product.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @product = Product.new(product_params)
    @product.restaurant = @restaurant
    if @product.save
      redirect_to product_path(@product)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(params[:product])
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to restaurant_products_path, status: :see_other
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :ingredients, :photo)
  end
end
