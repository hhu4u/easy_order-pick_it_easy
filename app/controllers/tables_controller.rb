class TablesController < ApplicationController
  def index
    @tables = Table.where(restaurant: @restaurant)
  end

  def new
    @table = Table.new
  end

  def create
    @table = Table.new(table_params)
    @table.restaurant = @restaurant
    raise
    if @table.save
      redirect_to tables_path
    else
      render :new
    end
  end

  def scan_qr_code
    restaurant_id = params[:restaurant_id]
    table_number = params[:table_number]
    restaurant = Restaurant.find(restaurant_id)
    basket = Basket.new

    if restaurant
      redirect_to restaurant_path(restaurant, table_number: table_number, basket: basket)
    else
      redirect_to root_path, alert: "Invalid QR code"
    end
  end

  private

  def table_params
    params.require(:table).permit(:number, :photo)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

end
