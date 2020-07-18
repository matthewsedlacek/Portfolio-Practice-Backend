class RemovePurchasePriceFromTransactions < ActiveRecord::Migration[6.0]
  def change
    remove_column :transactions, :purchase_price, :string
  end
end
