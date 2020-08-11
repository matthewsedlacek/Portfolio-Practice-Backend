class Company < ApplicationRecord
    # has_many :stock_prices
    has_many :transactions
    has_many :watchlist_companies
    has_many :watchlists, through: :watchlist_companies

end
