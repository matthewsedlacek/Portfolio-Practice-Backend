class PortfolioSerializer < ActiveModel::Serializer
  attributes :id, :name, :value, :user_id
  has_many :transactions
end
