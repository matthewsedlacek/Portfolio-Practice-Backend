
class CreateWatchlistPrices < ActiveRecord::Migration[6.0]
    def change
      create_table :watchlist_prices do |t|
        t.integer :watchlist_id
        t.integer :stock_price_id
  
        t.timestamps
      end
    end
  end