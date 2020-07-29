class Watchlist < ApplicationRecord
    belongs_to :user
    has_many :watchlist_prices
    has_many :stock_prices, through: :watchlist_prices
    has_many :companies, through: :stock_prices

end
