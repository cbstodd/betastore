class RenameCreditCardIdToOrders < ActiveRecord::Migration
  def change
    rename_column :orders, :credit_card, :credit_card_id
  end
end
