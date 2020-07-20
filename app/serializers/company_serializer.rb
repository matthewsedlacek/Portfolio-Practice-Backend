class CompanySerializer < ActiveModel::Serializer
  attributes :id, :ticker, :name, :logo, :sector
end
