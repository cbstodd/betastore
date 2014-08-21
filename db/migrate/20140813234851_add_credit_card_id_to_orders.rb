class AddCreditCardIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :credit_card, :integer
  end
end
