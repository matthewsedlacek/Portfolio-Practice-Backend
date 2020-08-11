class CompanySerializer < ActiveModel::Serializer
  attributes :id, :ticker, :name, :logo, :sector
  has_many :transactions
end
