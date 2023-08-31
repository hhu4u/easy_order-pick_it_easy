class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :create_basket
  #after_sign_in :create_basket

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo
  has_many :orders
  has_many :baskets

  # private

  def create_basket
    @basket = Basket.new
    # Correct with qr code path
    @table = Table.first
    @basket.table = @table
    @basket.basket_status = "New"
    @basket.user = self
    @basket.save
  end
end
