class AddDishTypeToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :dish_type, :string
  end
end
