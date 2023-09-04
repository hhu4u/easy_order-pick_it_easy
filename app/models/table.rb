class Table < ApplicationRecord
  belongs_to :restaurant
  # has_one_attached :photo
  has_many :baskets
end
