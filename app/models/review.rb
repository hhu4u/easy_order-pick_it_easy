class Review < ApplicationRecord
  belongs_to :order
  # belongs_to :user, through: :orders
  # belongs_to :product, through: :orders
end
