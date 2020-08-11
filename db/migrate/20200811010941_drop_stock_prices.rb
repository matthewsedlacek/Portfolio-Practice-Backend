class DropStockPrices < ActiveRecord::Migration[6.0]
  def change
    drop_table :stock_prices
  end
end
