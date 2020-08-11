class Dropwatchlistprices < ActiveRecord::Migration[6.0]
  def change

    drop_table :watchlist_prices
  end
end
