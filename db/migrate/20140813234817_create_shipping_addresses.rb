class CreateShippingAddresses < ActiveRecord::Migration
  def change
    create_table :shipping_addresses do |t|
      t.belongs_to :customer, index: true
      t.string :street
      t.string :zip_code
      t.string :city

      t.timestamps
    end
  end
end
