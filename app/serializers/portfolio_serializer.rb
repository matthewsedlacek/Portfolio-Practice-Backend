class PortfolioSerializer < ActiveModel::Serializer
  attributes :id, :name, :starting_value, :user_id, :locked_in_value, :available_cash
  has_many :transactions
end