class Product < ApplicationRecord
  DISH_TYPE = ["Starters", "Main Courses", "Desserts", "Wines", "Cocktails", "Soft drinks"]
  belongs_to :restaurant
  validates :dish_type, inclusion: { in: DISH_TYPE }
  has_one_attached :photo
  has_many :orders
  has_many :reviews, through: :orders
end
