class AddCheckoutSessionIdToBaskets < ActiveRecord::Migration[7.0]
  def change
    add_column :baskets, :checkout_session_id, :string
  end
end
