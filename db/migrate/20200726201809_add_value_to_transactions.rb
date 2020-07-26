class AddValueToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :value, :float
  end
end
