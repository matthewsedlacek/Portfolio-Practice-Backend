class AddSharePriceToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :share_price, :float
  end
end
