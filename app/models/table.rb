class Table < ApplicationRecord
  belongs_to :restaurant
  has_one_attached :photo
  after_create :generate_qr_code

  def generate_qr_code
    qr = RQRCode::QRCode.new("restaurant:#{restaurant.id},table:#{number}")
    qr_code_image.attach(io: StringIO.new(qr.to_img.resize(300, 300).to_blob), filename: "qr_code_#{id}.png", content_type: 'image/png')
    raise
  end
end
