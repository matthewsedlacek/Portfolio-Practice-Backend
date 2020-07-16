class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.integer :stock_price_id
      t.integer :portfolio_id
      t.string :buy_sell
      t.integer :quantity
      t.string :purchase_price

      t.timestamps
    end
  end
end
