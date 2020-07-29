class WatchlistSerializer < ActiveModel::Serializer
  attributes :id, :user_id
  has_many :stock_prices
  has_many :companies
end
