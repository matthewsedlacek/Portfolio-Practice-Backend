class WatchlistSerializer < ActiveModel::Serializer
  attributes :id, :user_id
  has_many :companies
  has_many :watchlist_companies
end
