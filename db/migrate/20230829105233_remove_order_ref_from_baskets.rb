class RemoveOrderRefFromBaskets < ActiveRecord::Migration[7.0]
  def change
    remove_reference :baskets, :order
  end
end
