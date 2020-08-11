class WatchlistCompanySerializer < ActiveModel::Serializer
  attributes :id, :watchlist_id, :company_id
  belongs_to :watchlist
  belongs_to :company
end
