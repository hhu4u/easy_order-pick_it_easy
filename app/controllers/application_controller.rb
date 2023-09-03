class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name photo])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name photo])
  end

  def after_sign_in_path_for(resource)
    # raise
    if resource.orders.any?
      restaurant = resource.orders.last.basket.table.restaurant
      restaurant_path(restaurant)
    else
      root_path
    end
  end
end
