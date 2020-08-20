class Company < ApplicationRecord
    has_many :transactions
    has_many :watchlist_companies
    has_many :watchlists, through: :watchlist_companies

end
