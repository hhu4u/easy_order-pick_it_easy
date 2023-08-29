class Product < ApplicationRecord
  belongs_to :restaurant
  validates :dish_type, inclusion: { in: ["Starters", "Main Courses", "Desserts", "Wines", "Cocktails", "Soft drinks"] }
end
