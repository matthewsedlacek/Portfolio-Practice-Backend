class WatchlistPrice < ApplicationRecord
    belongs_to :watchlist
    belongs_to :stock_price
end
