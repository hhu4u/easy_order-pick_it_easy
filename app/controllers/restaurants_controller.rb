class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update]
  def index
    @restaurants = Restaurant.where(user: current_user)
  end

  def show
    @current_basket = Basket.where(user: current_user, basket_status: "New").first
    @basket = @current_basket
    @table = @current_basket.table
    @products = @restaurant.products

    if params[:query].present?
      sql_subquery = "name ILIKE :query OR ingredients ILIKE :query"
      @products = @products.where(sql_subquery, query: "%#{params[:query]}%")
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'products/products_list', locals: { restaurant: @restaurant, products: @products }, formats: [:html] }
    end
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    if @restaurant.save!
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @restaurant.update(restaurant_params)
    redirect_to restaurant_path(@restaurant)
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :photo)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
