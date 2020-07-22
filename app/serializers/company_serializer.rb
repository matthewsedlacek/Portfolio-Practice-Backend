class CompanySerializer < ActiveModel::Serializer
  attributes :id, :ticker, :name, :logo, :sector
  has_many :stock_prices
end
