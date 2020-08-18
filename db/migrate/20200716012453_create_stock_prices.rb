
class CreateStockPrices < ActiveRecord::Migration[6.0]
    def change
      create_table :stock_prices do |t|
        t.integer :company_id
        t.float :current_price
        t.string :dollar_change
        t.string :percent_change
        t.string :as_of_time
        t.string :daily_high
        t.string :daily_low
        t.string :fifty_two_week_high
        t.string :fifty_two_week_low
        t.boolean :transacted
        t.timestamps
      end
    end
  end