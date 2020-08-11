class Watchlist < ApplicationRecord
    belongs_to :user
    has_many :watchlist_companies
    has_many :companies, through: :watchlist_companies
    # has_many :stock_prices, through: :watchlist_prices
    # has_many :companies, through: :stock_prices

end
