class Product < ApplicationRecord
  DISH_TYPE = ["Starters", "Main Courses", "Desserts", "Wines", "Cocktails", "Beers", "Soft drinks"]
  belongs_to :restaurant
  validates :dish_type, inclusion: { in: DISH_TYPE }
  has_one_attached :photo
  has_one_attached :thumbnail
  has_many :orders
  has_many :reviews, through: :orders
end
