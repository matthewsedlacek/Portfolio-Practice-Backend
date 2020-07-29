class StockPrice < ApplicationRecord
    belongs_to :company
    has_many :transactions
    has_many :watchlist_prices
    has_many :watchlists, through: :watchlist_prices
end
