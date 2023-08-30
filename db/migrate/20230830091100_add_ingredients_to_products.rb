class AddIngredientsToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :ingredients, :string
  end
end
