class AddQrCodeToTables < ActiveRecord::Migration[7.0]
  def change
    add_column :tables, :qr_code, :string
  end
end
