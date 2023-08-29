class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :products
  validates :name, :address, presence: true
  has_one_attached :photo
end
