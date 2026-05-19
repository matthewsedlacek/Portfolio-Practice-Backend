class AddIndexesToForeignKeys < ActiveRecord::Migration[7.0]
  def change
    add_index :portfolios, :user_id
    add_index :transactions, :portfolio_id
    add_index :transactions, :company_id
    add_index :watchlists, :user_id
    add_index :watchlist_companies, :watchlist_id
    add_index :watchlist_companies, :company_id
  end
end
