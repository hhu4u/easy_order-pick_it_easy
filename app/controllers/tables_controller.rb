class TablesController < ApplicationController
  before_action :set_restaurant, only: [:new, :create, :index]
  def index
    @tables = Table.where(restaurant: @restaurant)
  end

  def new
    @table = Table.new
  end


  def create
    @table = Table.new(table_params)
    @table.restaurant = @restaurant
    generate_qr_code
    @table.qr_code = @svg
    if @table.save
      generate_qr_code
      @table.qr_code = @svg
      if @table.save
        redirect_to restaurant_tables_path(@restaurant)
      else
        render :new
      end
    else
      render :new
    end
  end

  def generate_qr_code
    qr = RQRCode::QRCode.new("https://www.pickiteasy.me/restaurants/#{@restaurant.id}/?table=#{@table.id}&basket=new")
    @svg = qr.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      standalone: true
    )
  end

  private

  def table_params
    params.require(:table).permit(:number, :photo)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
