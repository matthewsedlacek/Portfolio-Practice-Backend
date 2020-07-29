class WatchlistPriceSerializer < ActiveModel::Serializer
  attributes :id, :watchlist_id, :stock_price_id
  belongs_to :stock_price
  belongs_to :watchlist
end
