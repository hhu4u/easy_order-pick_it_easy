class Basket < ApplicationRecord
  belongs_to :table
  has_many :orders
  # belongs_to :order
end
