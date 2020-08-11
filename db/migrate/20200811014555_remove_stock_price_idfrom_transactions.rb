class RemoveStockPriceIdfromTransactions < ActiveRecord::Migration[6.0]
  def change
    remove_column :transactions, :stock_price_id, :integer
  end
end
