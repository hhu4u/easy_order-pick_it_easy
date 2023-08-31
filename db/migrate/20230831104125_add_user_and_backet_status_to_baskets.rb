class AddUserAndBacketStatusToBaskets < ActiveRecord::Migration[7.0]
  def change
    add_reference :baskets, :user
    add_column :baskets, :basket_status, :string
  end
end
